class AddBrandCollectionToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :collection_id, :integer
    add_column :items, :brand_id, :integer
  end

  def self.down
    remove_column :items, :brand_id
    remove_column :items, :collection_id
  end
end
