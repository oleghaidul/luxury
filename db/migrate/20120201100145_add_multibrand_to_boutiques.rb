class AddMultibrandToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :multibrand, :boolean
  end

  def self.down
    remove_column :boutiques, :multibrand
  end
end
