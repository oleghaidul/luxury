ActiveAdmin.register Brand do
  
  member_action :delete_id, :method => :post do
    category = BrandCategory.where(:brand_id => params[:id], :category_id => params[:cat_id]).first
    category.destroy
    redirect_to :back, :notice => "was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    collection_brand = CollectionBrand.where(:collection_id => params[:collection_id], 
                                              :brand_id => params[:id],
                                              :boutique_id => params[:boutique_id]).first
    brand_categories = BrandCategory.new(:brand_id => params[:id], 
                                          :category_id => params[:cat_id],
                                          :collection_brand_id => collection_brand.id,
                                          :boutique_id => params[:boutique_id],
                                          :collection_id => params[:collection_id])
    if brand_categories.save
      redirect_to :back, :notice => "was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  # scope :mine, :default => true do |brands|
  #   if can? :manage, @brand
  #     brands
  #   else
  #     brands.where(:admin_user_id => current_admin_user.id)
  #   end
  # end

  controller do
    before_filter :admin, :except => [:index, :new, :create]
    def admin
      @brand = Brand.find(params[:id])
    end
  end


  index do
    column :name, :sortable => true do |m|
      auto_link(m)
    end
    default_actions
  end

  show :title => Proc.new{ if params[:boutique_id] && params[:collection_id]; 
                            "#{Boutique.find(params[:boutique_id]).name} - "+
                            "#{Collection.find(params[:collection_id]).year} - "+
                            "#{Collection.find(params[:collection_id]).season} - "+
                            "#{Brand.find(params[:id]).name}"; 
                          else; 
                            "#{Brand.find(params[:id]).name}"; 
                          end } do
    panel "Brand Details" do
      attributes_table_for brand do
        row :name
      end
    end

    if params[:boutique_id] && params[:collection_id]
      panel "Categories" do
        table_for(brand.categories.current_boutique(params[:boutique_id], params[:collection_id])) do |t|
          t.column(:name) { |category| link_to category.name, admin_category_path(category,
                                                              :boutique_id => params[:boutique_id],
                                                              :collection_id => params[:collection_id],
                                                              :brand_id => params[:id]) }
                                                                    
          t.column() { |category| link_to "Delete", delete_id_admin_brand_path(brand, :cat_id => category), :method => :post, :confirm => "Are you sure?" }
        end
      end
    end
    if params[:boutique_id] && params[:collection_id]
      panel "Add categories to this brand" do
        table_for(Category.excluding_ids(brand.categories.current_boutique(params[:boutique_id], params[:collection_id]))) do |t|
          t.column(:name) { |category| link_to category.name, admin_category_path(category) }
          t.column() { |category| link_to "Add", add_id_admin_brand_path(brand, 
                                                :cat_id => category, 
                                                :boutique_id => params[:boutique_id],
                                                :collection_id => params[:collection_id],
                                                :brand_id => params[:id]),
                                                :method => :post, 
                        :confirm => "Are you sure add this category to this brand?" 
                        }
        end
      end
    end

  end
  

  form :partial => 'form'
end
