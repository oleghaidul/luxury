class Brand < ActiveRecord::Base
  belongs_to :boutique
  belongs_to :admin_user
  has_many :collections
  has_many :items, :through => :collections
  
end
