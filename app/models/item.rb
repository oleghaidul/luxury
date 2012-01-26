class Item < ActiveRecord::Base
	belongs_to :collection
	belongs_to :category
	belongs_to :brand
	belongs_to :admin_user
	attr_accessible :name, :structure, :price, :description, :discount, :gender, :brand_id, :admin_user_id, :category_id, :collection_id, :pictures_attributes
	has_many :pictures
	accepts_nested_attributes_for :pictures

	has_many :rates

	def rating
		rates.any? ? rates.average(:count) : 0.to_d
	end

end
