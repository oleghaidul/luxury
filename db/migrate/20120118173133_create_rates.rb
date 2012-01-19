class CreateRates < ActiveRecord::Migration
  def self.up
    create_table :rates do |t|
      t.integer :count
      t.integer :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rates
  end
end
