class CreateBrandCategories < ActiveRecord::Migration
  def self.up
    create_table :brand_categories do |t|
      t.integer :brand_id
      t.integer :category_id
      t.integer :brand_id
      t.integer :boutique_id
      t.integer :collection_brand_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brand_categories
  end
end
