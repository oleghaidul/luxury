class Category < ActiveRecord::Base
	has_and_belongs_to_many :brands
	has_many :items
	belongs_to :admin_user

	validates :name, :presence => true

	# def to_label
	# 	col = Brand.find_by_name(brand.name).collection
	# 	if brand && col
	# 		"#{col.year} - #{col.season} - #{brand.name} - #{name}"
	# 	else
	# 		"#{name}"
	# 	end
	# end
end
