class AddColumnToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :phone, :string
    add_column :boutiques, :phone2, :string
    add_column :boutiques, :director, :string
    add_column :boutiques, :address, :string
  end

  def self.down
    remove_column :boutiques, :address
    remove_column :boutiques, :director
    remove_column :boutiques, :phone2
    remove_column :boutiques, :phone
  end
end
