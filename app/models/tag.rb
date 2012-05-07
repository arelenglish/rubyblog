class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :article_tags
  has_many :articles, :through => :article_tags
  
  def formatted_created_at
    self.created_at.strftime('%b %d') if self.created_at
  end
end
