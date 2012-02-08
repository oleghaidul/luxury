class Boutique < ActiveRecord::Base
  has_and_belongs_to_many :collections
  has_many :boutique_collections
  has_many :collections, :through => :boutique_collections
  belongs_to :admin_user
  has_attached_file :ico
  has_attached_file :image

  validates :name, :presence => true, :uniqueness => true
  validates :url_bout, :presence => true, :uniqueness => true
end