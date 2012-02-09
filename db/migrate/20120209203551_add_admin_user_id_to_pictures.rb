class AddAdminUserIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :admin_user_id, :integer
  end

  def self.down
    remove_column :pictures, :admin_user_id
  end
end
