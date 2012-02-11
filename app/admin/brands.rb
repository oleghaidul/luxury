ActiveAdmin.register Brand do
  
  member_action :delete_id, :method => :post do
    cat = Category.find(params[:cat_id])
    category = BrandCategory.where(:brand_id => params[:id], :category_id => params[:cat_id]).first
    cat.boutique_id = nil
    cat.save
    category.destroy
    redirect_to :back, :notice => "was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    bout_id = current_admin_user.boutique.id
    cat = Category.find(params[:cat_id])
    brand_categories = BrandCategory.new(:brand_id => params[:id], 
                                            :category_id => params[:cat_id],
                                            :boutique_id => bout_id)
    cat.boutique_id = bout_id           
    cat.save                             
    if brand_categories.save
      redirect_to :back, :notice => "was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  scope :mine, :default => true do |brands|
    if can? :manage, @brand
      brands
    else
      brands.where(:admin_user_id => current_admin_user.id)
    end
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
        t.column(:name) { |category| link_to category.name, admin_category_path(category) }
        t.column() { |category| link_to "Delete", delete_id_admin_brand_path(brand, :cat_id => category), :method => :post, :confirm => "Are you sure?" }
      end
    end

    panel "Add categories to this brand" do
      table_for(Category.mine(current_admin_user.id).excluding_ids(brand.category_ids)) do |t|
        t.column(:name) { |category| link_to category.name, admin_category_path(category) }
        t.column() { |category| link_to "Add", add_id_admin_brand_path(brand, :cat_id => category), :method => :post, 
                      :confirm => "Are you sure add this category to this brand?" }
      end
    end

  end
  

  form :partial => 'form'
end
