ActiveAdmin.register Collection do
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

    panel "Brands" do
      table_for(collection.brands) do |t|
        t.column(:name) { |col| link_to col.name, admin_collection_path(col) }
        t.column :collection
        t.column() { |col| link_to "Edit", edit_admin_collection_path(col) }
        t.column() { |col| link_to "Delete", admin_collection_path(col), :method => :delete, :confirm => "Are you sure?" }
        
      end
    end
  end

end
