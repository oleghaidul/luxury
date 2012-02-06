class CreateBoutiqueCollections < ActiveRecord::Migration
  def self.up
    create_table :boutique_collections do |t|
      t.integer :boutique_id
      t.integer :collection_id

      t.timestamps
    end
  end

  def self.down
    drop_table :boutique_collections
  end
end
