class AddAdminUserIdToBrands < ActiveRecord::Migration
  def self.up
    add_column :brands, :admin_user_id, :integer
  end

  def self.down
    remove_column :brands, :admin_user_id
  end
end
