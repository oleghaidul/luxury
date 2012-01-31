class AddNewCollectionToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :new_collection, :boolean
  end

  def self.down
    remove_column :collections, :new_collection
  end
end
