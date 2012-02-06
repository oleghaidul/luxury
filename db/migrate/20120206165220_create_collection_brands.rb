class CreateCollectionBrands < ActiveRecord::Migration
  def self.up
    create_table :collection_brands do |t|
      t.integer :collection_id
      t.integer :brand_id
      t.integer :boutique_collection_id
      t.integer :boutique_id

      t.timestamps
    end
  end

  def self.down
    drop_table :collection_brands
  end
end
