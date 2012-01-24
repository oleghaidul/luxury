class AddSubdomainToBoutiques < ActiveRecord::Migration
  def self.up
    add_column :boutiques, :subdomain, :string
  end

  def self.down
    remove_column :boutiques, :subdomain
  end
end
