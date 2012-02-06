class AddBoutiqueIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :boutique_id, :integer
  end

  def self.down
    remove_column :categories, :boutique_id
  end
end
