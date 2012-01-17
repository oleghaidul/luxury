class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.integer :item_id
      t.has_attached_file :image

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
