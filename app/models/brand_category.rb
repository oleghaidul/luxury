class BrandCategory < ActiveRecord::Base
	belongs_to :collection_brand
	has_many :category_items

	belongs_to :brand
	belongs_to :category
end
