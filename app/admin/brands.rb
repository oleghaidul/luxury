ActiveAdmin.register Brand do
  
  member_action :delete_id, :method => :post do
    collection = URI(request.referer).path.split("/")[3]
    brand = CollectionBrand.where(:collection_id => collection, :brand_id => params[:id]).first
    brand.destroy
    redirect_to :back, :notice => "was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    collection = URI(request.referer).path.split("/")[3]
    brand = Brand.find(params[:id])
    current_brand = brand.collection_brands.build(:collection_id => collection)
    if current_brand.save
      redirect_to :back, :notice => "was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

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

    panel "Categories" do
      table_for(brand.categories) do |t|
        t.column(:name) { |i| link_to i.name, admin_category_path(i) }
        t.column() { |i| link_to "Delete", delete_id_admin_category_path(i), :method => :post, :confirm => "Are you sure?" }
      end
    end

    panel "Add categories to this brand" do
      table_for(Category.excluding_ids(brand.category_ids)) do |t|
        t.column(:name) { |i| link_to i.name, admin_category_path(i) }
        t.column() { |i| link_to "Add", add_id_admin_category_path(i), :method => :post, 
                      :confirm => "Are you sure add this category to this brand?" }
      end
    end

  end
  

  form :partial => 'form'
end
