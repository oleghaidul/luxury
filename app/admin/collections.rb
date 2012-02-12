ActiveAdmin.register Collection do

  member_action :delete_id, :method => :post do
    brand = CollectionBrand.where(:collection_id => params[:id], :brand_id => params[:br_id]).first
    brand.destroy
    redirect_to :back, :notice => "was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    boutique_collection = BoutiqueCollection.where(:boutique_id => params[:boutique_id], :collection_id => params[:id]).first
    collection_brand = CollectionBrand.new(:collection_id => params[:id], 
                                            :brand_id => params[:br_id],
                                            :boutique_id => params[:boutique_id],
                                            :boutique_collection_id => boutique_collection.id)
    if collection_brand.save
      redirect_to :back, :notice => "was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  # scope :mine, :default => true do |collections|
  #   if can? :manage, @collection
  #     collections
  #   else
  #     collections.where(:admin_user_id => current_admin_user.id)
  #   end
  # end

  form :partial => "form"

  index do
    column :name, :sortable => :name do |col|
      auto_link(col)
    end
    column :new_collection, :sortable => :new_collection do |m|
      status_tag (m.new_collection ? "Yes" : "No"), (m.new_collection ? :ok : :error)
    end
    column :year
    column :season
    default_actions
  end

  show :title => :name do
    panel "Collection Details" do
      attributes_table_for collection do
        row :name
        row(:new_collection) { status_tag (collection.new_collection ? "Yes" : "No"), (collection.new_collection ? :ok : :error) }
        row :year
        row :season
      end

    end
    if params[:boutique_id]
      panel "#{collection.name} brands" do
        table_for(collection.brands.current_boutique(params[:boutique_id])) do |t|
          t.column(:name) { |brand| link_to brand.name, admin_brand_path(brand, 
                                                        :boutique_id => params[:boutique_id],
                                                        :collection_id => params[:id] ) }
                                                                
          t.column() { |brand| link_to "Delete", delete_id_admin_collection_path(collection, 
                                            :br_id => brand), 
                                            :method => :post, 
                                            :confirm => "Are you sure?" }
        end
      end
    
      panel "Add brands to this collection", :only => :show do
        table_for(Brand.excluding_ids(collection.brands.current_boutique(params[:boutique_id]))) do |t|
          t.column(:name) { |brand| link_to brand.name, admin_brand_path(brand) }
          t.column() { |brand| link_to "Add", add_id_admin_collection_path(collection, 
                                            :br_id => brand, 
                                            :boutique_id => params[:boutique_id]), 
                                            :method => :post, 
                       :confirm => "Are you sure add this brand to this collection?" }
        end
      end
    end
  end
end
