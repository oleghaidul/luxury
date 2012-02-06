class BoutiqueCollection < ActiveRecord::Base
	belongs_to :boutique
	has_many :collection_brands
end
