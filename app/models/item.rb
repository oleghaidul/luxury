class Item < ActiveRecord::Base
	belongs_to :collection
	has_many :pictures
end
