class Category < ActiveRecord::Base
	belongs_to :admin_user

	has_many :brand_categories
  has_many :brands, :through => :brand_categories

  has_many :category_items
  has_many :items, :through => :category_items

	validates :name, :presence => true

	scope :excluding_ids, lambda { |ids|
	  where(['id NOT IN (?)', ids]) if ids.any?
	}

	# def to_label
	# 	" #{name}"
	# end
end
