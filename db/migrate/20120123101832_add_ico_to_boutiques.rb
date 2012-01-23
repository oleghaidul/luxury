class AddIcoToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :ico_file_name, :string
    add_column :boutiques, :ico_content_type, :string
    add_column :boutiques, :ico_file_size, :integer
    add_column :boutiques, :ico_updated_at, :datetime
  end

  def self.down
    remove_column :boutiques, :ico_updated_at
    remove_column :boutiques, :ico_file_size
    remove_column :boutiques, :ico_content_type
    remove_column :boutiques, :ico_file_name
  end
end
