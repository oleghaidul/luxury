class BrandsCollections < ActiveRecord::Migration
  def self.up
    create_table :brands_collections, :id => false do |t|
      t.integer :brand_id, :null => false
      t.integer :collection_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :brands_collections
  end
end
