ActiveAdmin.register Category do
  
  index do
    column :name, :sortable => true do |m|
      auto_link(m)
    end
    column :name_eng
    column :brand
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
        row :brand
      end
    end

    panel "Items" do
      table_for(category.items) do |t|
        t.column(:name) { |i| link_to i.name, admin_item_path(i) }
        t.column :category
        t.column("image") { |i| link_to image_tag(i.pictures.first.image.url(:small)), admin_picture_path(i.pictures.first) }
        t.column() { |i| link_to "Edit", edit_admin_item_path(i) }
        t.column() { |i| link_to "Delete", admin_item_path(i), :method => :delete, :confirm => "Are you sure?" }
      end
    end
  end
  

  form :partial => 'form'

end
