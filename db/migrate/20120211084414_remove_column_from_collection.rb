class RemoveColumnFromCollection < ActiveRecord::Migration
  def self.up
  	remove_column :collections, :boutique_id
  end

  def self.down
  	add_column :collections, :boutique_id, :integer
  end
end
