class Category < ActiveRecord::Base

	has_many :brand_categories
  has_many :brands, :through => :brand_categories

  has_many :category_items
  has_many :items, :through => :category_items

	validates :name, :presence => true
	validates :name_eng, :presence => true, :format => /^\S+[a-zA-Z]+$/

	scope :excluding_ids, lambda { |ids|
	  where(['id NOT IN (?)', ids]) if ids.any?
	}
	scope :mine, lambda { |id|
	  where(:admin_user_id => id)
	}

	# def to_label
	# 	" #{name}"
	# end
end
