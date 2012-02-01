ActiveAdmin.register Brand do

  

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
    column :name_eng
    column :collection
    default_actions
  end

  show :title => :name do
    panel "Brand Details" do
      attributes_table_for brand do
        row :name
        row :collection
      end
    end

    panel "Categories" do
      table_for(brand.categories) do |t|
        t.column(:name) { |cat| link_to cat.name, admin_category_path(cat) }
        t.column :brand
        t.column :name_eng
        t.column() { |cat| link_to "Edit", edit_admin_category_path(cat) }
        t.column() { |cat| link_to "Delete", admin_category_path(cat), :method => :delete, :confirm => "Are you sure?" }
      end
    end
  end
  

  form :partial => 'form'
end
