class Collection < ActiveRecord::Base
	belongs_to :boutique
	belongs_to :admin_user
	has_many :items
end
