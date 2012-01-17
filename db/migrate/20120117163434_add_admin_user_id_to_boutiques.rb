class AddAdminUserIdToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :admin_user_id, :integer
  end

  def self.down
    remove_column :boutiques, :admin_user_id
  end
end
