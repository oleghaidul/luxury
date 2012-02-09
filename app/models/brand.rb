class Brand < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :boutique
  has_many :items
  has_many :collection_brands
  has_many :collections, :through => :collection_brands

  has_many :brand_categories
  has_many :categories, :through => :brand_categories

  validates :name, :presence => true

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }
  scope :mine, lambda { |id|
    where(:admin_user_id => id)
  }

  # def to_label
  #   "#{name}"
  # end

end
