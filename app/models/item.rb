class Item < ActiveRecord::Base
  belongs_to :admin_user
  attr_accessible :name, :structure, :price, :description, :discount, :gender, :brand_id, :admin_user_id, :category_id, :collection_id, :pictures_attributes
  has_many :pictures
  accepts_nested_attributes_for :pictures
  belongs_to :collection
  belongs_to :category
  belongs_to :brand
  validates :name, :presence => true
  validates :category_id, :presence => true
  has_many :rates

  def rating
    rates.any? ? rates.average(:count) : 0.to_d
  end

  def to_label
    cat = category.nil? ? "" : category.name
    br = brand.nil? ? "" : brand.name
    if collection.nil?
      bout = ""
      col_year = ""
      col_season = ""
    else
      if collection.boutique_id == nil
        bout = ""
      else
        bout = Boutique.find(collection.boutique_id).name
      end
      col_year = collection.year
      col_season = collection.season
    end
    "#{bout} - #{col_year} - #{col_season} - #{br} #{cat} - #{name}"
  end

end
