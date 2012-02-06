class Brand < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :boutique
  has_many :items
  validates :name, :presence => true

  # def to_label
  # 	if collection
  # 		"#{collection.year} - #{collection.season} - #{name}"
  # 	else
  # 		"Without collection - #{name}"
  # 	end
  # end

end
