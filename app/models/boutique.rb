class Boutique < ActiveRecord::Base
	belongs_to :admin_user
	has_many :brands
	has_many :collections
	has_many :items, :through => :collections
	has_attached_file :ico
	has_attached_file :image

end
