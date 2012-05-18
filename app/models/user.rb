class User < ActiveRecord::Base
  has_many :articles
  
  attr_accessible :username, :email, :password, :password_confirmation, :role
  has_secure_password
  validates_presence_of :password, :email, :on => :create
  validates :email, :uniqueness => true
  
  ROLES = %W[admin moderator]
  
  def formatted_created_at
    self.created_at.strftime('%b %d') if self.created_at
  end
 
end
