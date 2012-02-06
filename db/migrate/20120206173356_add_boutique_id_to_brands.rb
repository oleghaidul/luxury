class AddBoutiqueIdToBrands < ActiveRecord::Migration
  def self.up
    add_column :brands, :boutique_id, :integer
  end

  def self.down
    remove_column :brands, :boutique_id
  end
end
