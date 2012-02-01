class EditBrands < ActiveRecord::Migration
  def self.up
  	rename_column :brands, :boutique_id, :collection_id
  end

  def self.down
  	rename_column :brands, :collection_id, :boutique_id
  end
end
