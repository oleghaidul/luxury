class AddNameEngToBrands < ActiveRecord::Migration
  def self.up
    add_column :brands, :name_eng, :string
  end

  def self.down
    remove_column :brands, :name_eng
  end
end
