class AddBoutiqueIdToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :boutique_id, :integer
  end

  def self.down
    remove_column :collections, :boutique_id
  end
end
