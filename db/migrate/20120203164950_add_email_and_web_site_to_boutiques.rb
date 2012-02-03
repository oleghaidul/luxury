class AddEmailAndWebSiteToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :email, :string
    add_column :boutiques, :website, :string
  end

  def self.down
    remove_column :boutiques, :website
    remove_column :boutiques, :email
  end
end
