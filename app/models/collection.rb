class Collection < ActiveRecord::Base
	has_and_belongs_to_many :boutiques
	belongs_to :admin_user
	has_many :brands

	validates :name, :presence => true

end
