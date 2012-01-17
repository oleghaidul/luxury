class Picture < ActiveRecord::Base
	belongs_to :item
	has_attached_file :image, :styles => {:small => '50x50>', :medium => '150x150>'}
end
