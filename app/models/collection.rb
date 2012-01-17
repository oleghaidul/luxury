class Collection < ActiveRecord::Base
	belongs_to :brand
	belongs_to :category
	has_many :items
end
