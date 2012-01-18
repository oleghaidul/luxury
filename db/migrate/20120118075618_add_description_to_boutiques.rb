class AddDescriptionToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :description, :text
  end

  def self.down
    remove_column :boutiques, :description
  end
end
