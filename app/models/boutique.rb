class Boutique < ActiveRecord::Base
  has_many :collections
  has_many :brands
  has_many :categories
  belongs_to :admin_user
  has_attached_file :ico
  has_attached_file :image

  validates :name, :presence => true, :uniqueness => true
  validates :url_bout, :presence => true, :uniqueness => true
end
