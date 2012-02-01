class EditCollection < ActiveRecord::Migration
  def self.up
  	remove_column :collections, :brand_id
  end

  def self.down
  	add_column :collections, :brand_id, :integer
  end
end
