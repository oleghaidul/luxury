class Collection < ActiveRecord::Base
	belongs_to :brand
	belongs_to :admin_user
	has_many :items
end
