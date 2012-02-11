ActiveAdmin.register Collection do

  member_action :delete_id, :method => :post do
    br = Brand.find(params[:br_id])
    brand = CollectionBrand.where(:collection_id => params[:id], :brand_id => params[:br_id]).first
    br.boutique_id = nil
    br.save
    brand.destroy
    redirect_to :back, :notice => "was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    br = Brand.find(params[:br_id])
    bout_id = current_admin_user.boutique.id
    collection_brand = CollectionBrand.new(:collection_id => params[:id], 
                                            :brand_id => params[:br_id],
                                            :boutique_id => bout_id)
    br.boutique_id = bout_id
    br.save
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

    panel "#{collection.name} brands" do
      table_for(collection.brands) do |t|
        t.column(:name) { |brand| link_to brand.name, admin_brand_path(brand) }
        t.column() { |brand| link_to "Delete", delete_id_admin_collection_path(collection, :br_id => brand), :method => :post, :confirm => "Are you sure?" }
      end
    end

    
  end
    sidebar "Add brands to this collection", :only => :show do
      table_for(Brand.excluding_ids(collection.brand_ids)) do |t|
        t.column(:name) { |brand| link_to brand.name, admin_brand_path(brand) }
        t.column() { |brand| link_to "Add", add_id_admin_collection_path(collection, :br_id => brand), :method => :post, 
                    :confirm => "Are you sure add this brand to this collection?" }
      end
    end
end
