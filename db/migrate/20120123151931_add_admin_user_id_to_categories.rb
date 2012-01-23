class AddAdminUserIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :admin_user_id, :integer
  end

  def self.down
    remove_column :categories, :admin_user_id
  end
end
