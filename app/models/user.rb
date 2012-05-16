class User < ActiveRecord::Base
  has_many :articles
  
  attr_accessible :username, :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true
  
  ROLES = %W[admin moderator]
  
end
