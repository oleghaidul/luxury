class BoutiqueCollection < ActiveRecord::Base
	belongs_to :boutique
	belongs_to :collection
	has_many :collection_brands, :dependent => :destroy
	validates_uniqueness_of :boutique_id, :scope => :collection_id
end
