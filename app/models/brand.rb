class Brand < ActiveRecord::Base
  belongs_to :collection
  belongs_to :admin_user
  has_many :categories
  has_many :items, :through => :collections
  validates :name, :presence => true
  validates :collection_id, :presence => true
end
