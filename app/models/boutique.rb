class Boutique < ActiveRecord::Base
	belongs_to :admin_user
	has_many :brands
	has_many :collections, :through => :brands
	has_attached_file :ico
	has_attached_file :image
	
	def to_param
		"#{url_bout}".parameterize
	end



end
