class Brand < ActiveRecord::Base
  belongs_to :boutique
  has_many :collections
  has_many :items, :through => :collections
  
end
