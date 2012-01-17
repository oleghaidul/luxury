class CreateBoutiques < ActiveRecord::Migration
  def self.up
    create_table :boutiques do |t|
      t.string :name
      t.string :url_bout

      t.timestamps
    end
  end

  def self.down
    drop_table :boutiques
  end
end
