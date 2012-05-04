class Author < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :twitter_handle
  has_many :articles
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def formatted_created_at
    self.created_at.strftime('%b %d %I:%M%p') if self.created_at
  end
end
