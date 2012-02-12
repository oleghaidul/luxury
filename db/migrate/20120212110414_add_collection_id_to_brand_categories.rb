class AddCollectionIdToBrandCategories < ActiveRecord::Migration
  def self.up
    add_column :brand_categories, :collection_id, :integer
  end

  def self.down
    remove_column :brand_categories, :collection_id
  end
end
