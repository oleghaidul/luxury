class Item < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :boutique
  attr_accessible :name, :boutique_id, :structure, :price, :description, :discount, :gender, :brand_id, :admin_user_id, :category_id, :collection_id, :pictures_attributes
  has_many :pictures
  accepts_nested_attributes_for :pictures
  validates :name, :presence => true
  has_many :rates


  has_many :category_items
  has_many :categories, :through => :category_items

  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids]) if ids.any?
  }
  scope :mine, lambda { |id|
    where(:admin_user_id => id)
  }

  def rating
    rates.any? ? rates.average(:count) : 0.to_d
  end


  # def to_label
  #   cat = category.nil? ? "" : category.name
  #   br = brand.nil? ? "" : brand.name
  #   if collection.nil?
  #     col_year = ""
  #     col_season = ""
  #   else
  #     col_year = collection.year
  #     col_season = collection.season
  #   end
  #   "#{col_year} - #{col_season} - #{br} #{cat} - #{name}"
  # end

end
