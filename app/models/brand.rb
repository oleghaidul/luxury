class Brand < ActiveRecord::Base
  has_and_belongs_to_many :collections
  belongs_to :admin_user
  has_and_belongs_to_many :categories
  validates :name, :presence => true

  # def to_label
  # 	if collection
  # 		"#{collection.year} - #{collection.season} - #{name}"
  # 	else
  # 		"Without collection - #{name}"
  # 	end
  # end

end
