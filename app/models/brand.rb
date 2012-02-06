class Brand < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :boutique
  has_many :items
  validates :name, :presence => true

  def to_label
    bout = boutique.nil? ? "" : boutique.name
    "#{bout} - #{name}"
  end

end
