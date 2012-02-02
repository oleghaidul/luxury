class Category < ActiveRecord::Base
	belongs_to :brand
	has_many :items
	belongs_to :admin_user

	validates :name, :presence => true
	validates :brand_id, :presence => true
end
