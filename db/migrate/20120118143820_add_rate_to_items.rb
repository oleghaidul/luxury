class AddRateToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :rate, :integer
  end

  def self.down
    remove_column :items, :rate
  end
end
