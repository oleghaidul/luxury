class Brand < ActiveRecord::Base
  belongs_to :collection
  belongs_to :admin_user
  has_many :categories
  validates :name, :presence => true

  def to_label
  	if collection
  		"#{collection.year} - #{collection.season} - #{name}"
  	else
  		"Without collection - #{name}"
  	end
  end

end
