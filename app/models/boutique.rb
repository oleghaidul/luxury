class Boutique < ActiveRecord::Base
  belongs_to :admin_user
  has_many :collections, :dependent => :destroy
  has_attached_file :ico
  has_attached_file :image

  validates :name, :presence => true, :uniqueness => true
  validates :url_bout, :presence => true, :uniqueness => true
end
