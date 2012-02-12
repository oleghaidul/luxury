class Boutique < ActiveRecord::Base
  has_and_belongs_to_many :collections
  has_many :boutique_collections
  has_many :collections, :through => :boutique_collections
  
  has_many :collection_brands
  has_many :brands, :through => :collection_brands

  has_many :brand_categories
  has_many :categories, :through => :brand_categories

  has_many :items

  belongs_to :admin_user
  has_attached_file :ico
  has_attached_file :image

  validates :name, :presence => true, :uniqueness => true
  validates :admin_user_id, :presence => true
  validates :url_bout, :presence => true, :uniqueness => true, :format => /^\S+[a-zA-Z]+$/
end