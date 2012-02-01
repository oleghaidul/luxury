class Brand < ActiveRecord::Base
  belongs_to :collection
  belongs_to :admin_user
  has_many :categories
  has_many :items, :through => :collections

end
