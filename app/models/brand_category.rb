class BrandCategory < ActiveRecord::Base
	belongs_to :collection_brand
	has_many :category_items, :dependent => :destroy

	belongs_to :brand
	belongs_to :category
	belongs_to :boutique
end
