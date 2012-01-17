class Brand < ActiveRecord::Base
  belongs_to :boutique
  has_many :collections
  
end
