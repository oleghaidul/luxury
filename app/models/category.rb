class Category < ActiveRecord::Base
	belongs_to :brand
	has_many :items
	belongs_to :admin_user
end
