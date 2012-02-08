ActiveAdmin.register Category do
  
  member_action :delete_id, :method => :post do
    brand = URI(request.referer).path.split("/")[3]
    category = BrandCategory.where(:brand_id => brand, :category_id => params[:id]).first
    category.destroy
    redirect_to :back, :notice => "category was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    brand = URI(request.referer).path.split("/")[3]
    category = Category.find(params[:id])
    current_category = category.brand_categories.build(:brand_id => brand)
    if current_category.save
      redirect_to :back, :notice => "category was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  scope :mine, :default => true do |categories|
    categories.where(:admin_user_id => current_admin_user.id)
  end

  index do
    column :name, :sortable => true do |m|
      auto_link(m)
    end
    column :name_eng
    default_actions
  end

  controller do
		before_filter :admin, :except => [:index, :new, :create]
		def admin
			@category = Category.find(params[:id])
		end
	end

  controller.authorize_resource

  show :title => :name do
    panel "Category Details" do
      attributes_table_for category do
        row :name
      end
    end

    panel "Items" do
      table_for(category.items) do |t|
        t.column(:name) { |i| link_to i.name, admin_item_path(i) }
        t.column("image") { |i| link_to image_tag(i.pictures.first.image.url(:small)), admin_picture_path(i.pictures.first) }
        t.column() { |i| link_to "Delete", delete_id_admin_item_path(i), :method => :post, :confirm => "Are you sure?" }
      end
    end

    panel "Add items to this category" do
      table_for(Item.excluding_ids(category.item_ids)) do |t|
        t.column(:name) { |i| link_to i.name, admin_item_path(i) }
        t.column("image") { |i| link_to image_tag(i.pictures.first.image.url(:small)), admin_picture_path(i.pictures.first) }
        t.column() { |i| link_to "Add", add_id_admin_item_path(i), :method => :post, 
                    :confirm => "Are you sure add this item to this category?" }
      end
    end

  end
  

  form :partial => 'form'

end
