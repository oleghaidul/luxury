class Collection < ActiveRecord::Base
	belongs_to :boutique
	belongs_to :admin_user
	has_many :brands

	validates :name, :presence => true
	validates :boutique_id, :presence => true
end
