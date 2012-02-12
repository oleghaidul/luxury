class RemoveUnusedColumn2 < ActiveRecord::Migration
  def self.up
  	remove_column :brands, :collection_id
  	remove_column :brands, :boutique_id
  	remove_column :brands, :admin_user_id

  	remove_column :collections, :admin_user_id

  	remove_column :categories, :admin_user_id
  	remove_column :categories, :boutique_id
  	remove_column :categories, :brand_id
  end

  def self.down
  	add_column :brands, :collection_id, :integer
  	add_column :brands, :boutique_id, :integer
  	add_column :brands, :admin_user_id, :integer

  	add_column :collections, :admin_user_id, :integer

  	add_column :categories, :admin_user_id, :integer
  	add_column :categories, :brand_id, :integer
  	add_column :categories, :boutique_id, :integer
  end
end
