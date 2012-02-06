class RemoveUnusedTables < ActiveRecord::Migration
  def self.up
  	drop_table :boutiques_collections
  	drop_table :brands_collections
  	drop_table :brands_categories
  end

  def self.down
  	create_table :brands_collections, :id => false do |t|
      t.integer :brand_id, :null => false
      t.integer :collection_id, :null => false

      t.timestamps
    end
    create_table :boutiques_collections, :id => false do |t|
      t.integer :boutique_id, :null => false
      t.integer :collection_id, :null => false

      t.timestamps
    end
    create_table :brands_categories, :id => false do |t|
      t.integer :brand_id, :null => false
      t.integer :category_id, :null => false

      t.timestamps
    end
  end
end
