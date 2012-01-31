class AddNameEngToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :name_eng, :string
  end

  def self.down
    remove_column :categories, :name_eng
  end
end
