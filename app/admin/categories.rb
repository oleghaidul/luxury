ActiveAdmin.register Category do
  
  member_action :delete_id, :method => :post do
    item = CategoryItem.where(:category_id => params[:id], :item_id => params[:it_id]).first
    it = Item.find(params[:it_id])
    it.boutique_id = nil
    it.save
    item.destroy
    redirect_to :back, :notice => "Item was deleted from this category"
  end

  member_action :add_id, :method => :post do
    bout_id = current_admin_user.boutique.id
    cat_id = params[:id]
    category_item = CategoryItem.new(:category_id => cat_id, 
                                            :item_id => params[:it_id],
                                            :boutique_id => bout_id)
    item = Item.find(params[:it_id])
    item.boutique_id = bout_id                                  
    item.save
    if category_item.save
      redirect_to :back, :notice => "Item was added from this category"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  after_filter :only => :create do
    @admin = current_admin_user.id
  end

  # scope :mine, :default => true do |categories|
  #   if can? :manage, @category
  #     categories
  #   else
  #     categories.where(:admin_user_id => current_admin_user.id)
  #   end
  # end

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
      table_for(Item.where(:category_id => nil).excluding_ids(category.item_ids)) do |t|
        t.column(:name) { |item| link_to item.name, admin_item_path(item) }
        t.column("image") { |item| link_to image_tag(item.pictures.first.image.url(:small)), admin_picture_path(item.pictures.first) }
        t.column() { |item| link_to "Add", add_id_admin_category_path(category, :it_id => item), :method => :post, 
                    :confirm => "Are you sure add this item to this category?" }
      end
    end

  end
  

  form :partial => 'form'

end
