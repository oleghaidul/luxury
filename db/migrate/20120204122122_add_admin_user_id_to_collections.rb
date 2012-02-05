class AddAdminUserIdToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :admin_user_id, :integer
  end

  def self.down
    remove_column :collections, :admin_user_id
  end
end
