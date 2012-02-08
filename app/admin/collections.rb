ActiveAdmin.register Collection do

  member_action :delete_id, :method => :post do
    boutique = URI(request.referer).path.split("/")[3]
    collection = BoutiqueCollection.where(:boutique_id => boutique, :collection_id => params[:id]).first
    collection.destroy
    redirect_to :back, :notice => "collection was deleted from this boutique"
  end

  member_action :add_id, :method => :post do
    boutique = URI(request.referer).path.split("/")[3]
    collection = Collection.find(params[:id])
    current_collection = collection.boutique_collections.build(:boutique_id => boutique)
    if current_collection.save
      redirect_to :back, :notice => "collection was added from this boutique"
    else  
      redirect_to :back, :notice => "walidations failed"
    end
  end

  scope :mine, :default => true do |collections|
    collections.where(:admin_user_id => current_admin_user.id)
  end

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
        t.column(:name) { |i| link_to i.name, admin_brand_path(i) }
        t.column() { |i| link_to "Delete", delete_id_admin_brand_path(i), :method => :post, :confirm => "Are you sure?" }
      end
    end

    
  end
    sidebar "Add brands to this collection", :only => :show do
      table_for(Brand.excluding_ids(collection.brand_ids)) do |t|
        t.column(:name) { |i| link_to i.name, admin_brand_path(i) }
        t.column() { |i| link_to "Add", add_id_admin_brand_path(i), :method => :post, 
                    :confirm => "Are you sure add this brand to this collection?" }
      end
    end
end
