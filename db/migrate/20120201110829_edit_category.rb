class EditCategory < ActiveRecord::Migration
  def self.up
  	add_column :categories, :brand_id, :integer
  end

  def self.down
  	remove_column :categories, :brand_id
  end
end
