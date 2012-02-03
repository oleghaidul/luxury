class CreateBoutiquesCollections < ActiveRecord::Migration
  def self.up
    create_table :boutiques_collections, :id => false do |t|
      t.integer :boutique_id, :null => false
      t.integer :collection_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :boutiques_collections
  end
end
