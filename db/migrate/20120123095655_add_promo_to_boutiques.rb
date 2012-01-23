class AddPromoToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :promo, :text
    add_column :boutiques, :ico_file, :binary
  end

  def self.down
    remove_column :boutiques, :ico_file
    remove_column :boutiques, :promo
  end
end
