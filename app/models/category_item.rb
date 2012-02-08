class CategoryItem < ActiveRecord::Base
	belongs_to :brand_category
	belongs_to :category
	belongs_to :item
end
