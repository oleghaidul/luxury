class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.string :name
      t.integer :year
      t.string :season
      t.integer :brand_id

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
