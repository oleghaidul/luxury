class Collection < ActiveRecord::Base
	belongs_to :admin_user
	belongs_to :boutique
	has_many :items
	validates :name, :presence => true
	scope :nil_collection, :conditions => {:boutique_id => nil}
	def current_collection
		where("boutique_id = ?", boutique.id)
	end
end
