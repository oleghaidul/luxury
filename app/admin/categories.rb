ActiveAdmin.register Category do
  
  member_action :delete_id, :method => :post do
    item = CategoryItem.where(:category_id => params[:id], :item_id => params[:it_id]).first
    it = Item.find(params[:it_id])
    it.category_id = nil
    it.save
    item.destroy
    redirect_to :back, :notice => "Item was deleted from this category"
  end

  member_action :add_id, :method => :post do
    category_item = CategoryItem.new(:category_id => params[:id], 
                                            :item_id => params[:it_id],
                                            :boutique_id => current_admin_user.boutique.id)
    item = Item.find(params[:it_id])
    item.category_id = params[:id]                                        
    item.save
    if category_item.save
      redirect_to :back, :notice => "Item was added from this category"
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
        t.column(:name) { |item| link_to item.name, admin_item_path(item) }
        t.column("image") { |item| link_to image_tag(item.pictures.first.image.url(:small)), admin_picture_path(item.pictures.first) }
        t.column() { |item| link_to "Delete", delete_id_admin_category_path(category, :it_id => item), :method => :post, 
                            :confirm => "Are you sure?" }
      end
    end

    panel "Add items to this category" do
      table_for(Item.where(:category_id => nil).mine(current_admin_user.id).excluding_ids(category.item_ids)) do |t|
        t.column(:name) { |item| link_to item.name, admin_item_path(item) }
        t.column("image") { |item| link_to image_tag(item.pictures.first.image.url(:small)), admin_picture_path(item.pictures.first) }
        t.column() { |item| link_to "Add", add_id_admin_category_path(category, :it_id => item), :method => :post, 
                    :confirm => "Are you sure add this item to this category?" }
      end
    end

  end
  

  form :partial => 'form'

end
