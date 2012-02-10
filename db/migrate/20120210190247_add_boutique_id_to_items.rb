class AddBoutiqueIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :boutique_id, :integer
  end

  def self.down
    remove_column :items, :boutique_id
  end
end
