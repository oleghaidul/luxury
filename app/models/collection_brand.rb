class CollectionBrand < ActiveRecord::Base
	belongs_to :boutique_collection
	belongs_to :collection
	belongs_to :brand
	belongs_to :boutique

	has_many :brand_categories, :dependent => :destroy

	validates_uniqueness_of :collection_id, :scope => [:brand_id, :boutique_id]
end
