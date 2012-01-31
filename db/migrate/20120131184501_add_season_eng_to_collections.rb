class AddSeasonEngToCollections < ActiveRecord::Migration
  def self.up
    add_column :collections, :season_eng, :string
  end

  def self.down
    remove_column :collections, :season_eng
  end
end
