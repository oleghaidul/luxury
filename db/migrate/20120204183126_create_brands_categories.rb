class CreateBrandsCategories < ActiveRecord::Migration
  def self.up
    create_table :brands_categories, :id => false do |t|
      t.integer :brand_id, :null => false
      t.integer :category_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :brands_categories
  end
end
