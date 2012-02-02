class CreateLuxuryConfigs < ActiveRecord::Migration
  def self.up
    create_table :luxury_configs do |t|
      t.integer :home_page_images_timeout, :default => 5

      t.timestamps
    end
  end

  def self.down
    drop_table :luxury_configs
  end
end
