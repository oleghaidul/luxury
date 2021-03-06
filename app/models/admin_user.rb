class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  has_many :boutiques
  has_many :items
  has_many :brands
  has_many :categories
  has_many :collections
  has_many :pictures
 
 
  scope :excluding_ids, lambda { |ids|
    where(['id NOT IN (?)', ids])
  }

end