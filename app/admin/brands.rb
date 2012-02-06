ActiveAdmin.register Brand do
  
  scope :mine, :default => true do |brands|
    brands.where(:admin_user_id => current_admin_user.id)
  end

  controller do
    before_filter :admin, :except => [:index, :new, :create]
    def admin
      @brand = Brand.find(params[:id])
    end
  end

  controller.authorize_resource

  index do
    column :name, :sortable => true do |m|
      auto_link(m)
    end
    default_actions
  end

  show :title => :name do
    panel "Brand Details" do
      attributes_table_for brand do
        row :name
      end
    end

    panel "Items" do
      table_for(brand.items) do |t|
        t.column(:name) { |i| link_to i.name, admin_item_path(i) }
        t.column("image") { |i| link_to image_tag(i.pictures.first.image.url(:small)), admin_picture_path(i.pictures.first) }
        t.column() { |i| link_to "Delete", admin_item_path(i), :method => :delete, :confirm => "Are you sure?" }
      end
    end
  end
  

  form :partial => 'form'
end
