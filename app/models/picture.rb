class Picture < ActiveRecord::Base
	belongs_to :item
	accepts_nested_attributes_for :item
	has_attached_file :image, :styles => {:small => '50x50>', :medium => '150x150>', :large => "200x300#"}
end
