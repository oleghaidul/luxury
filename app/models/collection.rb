class Collection < ActiveRecord::Base
	has_many :boutique_collections
	has_many :boutiques, :through => :boutique_collections

	has_many :collection_brands
	has_many :brands, :through => :collection_brands do
		def current_boutique(id)
			where("collection_brands.boutique_id = ?",id)
		end
	end

	has_many :items

	validates :name, :presence => true
	validates_uniqueness_of :season, :scope => :year

	scope :nil_collection, :conditions => {:boutique_id => nil}
	
	scope :excluding_ids, lambda { |ids|
	  where(['id NOT IN (?)', ids]) if ids.any?
	}

	scope :mine, lambda { |id|
	  where(:admin_user_id => id)
	}

	def current_collection
		where("boutique_id = ?", boutique.id)
	end

	# def to_label
	# 	"#{year} - #{season}"
	# end
end
