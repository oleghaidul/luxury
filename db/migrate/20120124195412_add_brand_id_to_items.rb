class AddBrandIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :brand_id, :integer
  end

  def self.down
    remove_column :items, :brand_id
  end
end
