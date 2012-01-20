class AddBlobToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :icon_file, :longblob
  end

  def self.down
    remove_column :boutiques, :icon_file
  end
end
