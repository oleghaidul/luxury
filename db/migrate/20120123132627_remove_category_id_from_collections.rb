class RemoveCategoryIdFromCollections < ActiveRecord::Migration
  def self.up
  	remove_column :collections, :category_id
  end

  def self.down
  	add_column :collections, :category_id, :integer
  end
end
