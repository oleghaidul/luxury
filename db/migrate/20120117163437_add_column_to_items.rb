class AddColumnToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :structure, :string
    add_column :items, :description, :text
    add_column :items, :admin_user_id, :integer
    add_column :items, :price, :integer
    add_column :items, :discount, :integer
    add_column :items, :gender, :string
  end

  def self.down
    remove_column :items, :gender
    remove_column :items, :discount
    remove_column :items, :price
    remove_column :items, :admin_user_id
    remove_column :items, :description
    remove_column :items, :structure
  end
end
