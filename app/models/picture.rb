class Picture < ActiveRecord::Base
	belongs_to :item
	accepts_nested_attributes_for :item
	has_attached_file :image, :styles => {:small => '40x60#', :medium => '166x250#', :large => "200x300#"}
end
