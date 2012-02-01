class EditItems < ActiveRecord::Migration
  def self.up
  	remove_column :items, :brand_id
  	remove_column :items, :collection_id
  end

  def self.down
  	add_column :items, :brand_id, :integer
  	add_column :items, :collection_id, :integer
  end
end
