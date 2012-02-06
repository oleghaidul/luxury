ActiveAdmin.register Collection do

  member_action :delete_id, :method => :post do
      collection = Collection.find(params[:id])
      collection.boutique_id = nil
      collection.save!
      redirect_to :back, :notice => "#{collection.name} was deleted from this boutique"
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

    panel "Items" do
      table_for(collection.items) do |t|
        t.column(:name) { |i| link_to i.name, admin_item_path(i) }
        t.column("image") { |i| link_to image_tag(i.pictures.first.image.url(:small)), admin_picture_path(i.pictures.first) }
        t.column() { |i| link_to "Delete", delete_id_admin_item_path(i), :method => :post, :confirm => "Are you sure?" }
      end
    end
  end
end
