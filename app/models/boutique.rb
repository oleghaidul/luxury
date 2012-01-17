class Boutique < ActiveRecord::Base
	has_many :brands
	has_many :collections, :through => :brands
end
