class Category < ActiveRecord::Base
  attr_accessible :article_id, :name
  has_many :articles
  
  def formatted_created_at
    self.created_at.strftime('%b %d') if self.created_at
  end

end
