class Picture < ActiveRecord::Base
	belongs_to :item
	belongs_to :admin_user
	accepts_nested_attributes_for :item
	has_attached_file :image, :styles => {:small => '40x53#', :medium => '166x221#', :large => "270x360#", :extra_large => "337x450#"}
end
