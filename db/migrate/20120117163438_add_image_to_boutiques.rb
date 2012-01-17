class AddImageToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :image_file_name, :string
    add_column :boutiques, :image_content_type, :string
    add_column :boutiques, :image_file_size, :integer
    add_column :boutiques, :image_updated_at, :datetime
  end

  def self.down
    remove_column :boutiques, :image
  end
end
