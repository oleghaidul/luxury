class AddNameAndTimeoutToHomeImages < ActiveRecord::Migration
  def self.up
    add_column :home_images, :name, :string
    add_column :home_images, :timeout, :integer
    add_column :home_images, :alt_name, :string
  end

  def self.down
    remove_column :home_images, :timeout
    remove_column :home_images, :name
    remove_column :home_images, :alt_name
  end
end
