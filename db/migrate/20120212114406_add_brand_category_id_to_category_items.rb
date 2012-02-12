class AddBrandCategoryIdToCategoryItems < ActiveRecord::Migration
  def self.up
    add_column :category_items, :brand_category_id, :integer
  end

  def self.down
    remove_column :category_items, :brand_category_id
  end
end
