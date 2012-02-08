class CollectionBrand < ActiveRecord::Base
	belongs_to :boutique_collection
	belongs_to :collection
	belongs_to :brand
	has_many :brand_categories

	validates_uniqueness_of :collection_id, :scope => :brand_id
end
