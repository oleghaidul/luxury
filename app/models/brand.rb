class Brand < ActiveRecord::Base

  has_many :collection_brands
  has_many :collections, :through => :collection_brands

  has_many :brand_categories
  has_many :categories, :through => :brand_categories do
    def current_boutique(boutique_id, collection_id)
      where("brand_categories.boutique_id = ? AND brand_categories.collection_id = ?", boutique_id, collection_id)
    end

  end

  has_many :items

  validates :name, :presence => true
  validates :name_eng, :presence => true

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
