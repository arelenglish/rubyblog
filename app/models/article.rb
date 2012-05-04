class Article < ActiveRecord::Base
  attr_accessible :body, :title, :author_id, :category_id
  belongs_to :author
  belongs_to :category
  has_many :article_tags
  has_many :tags, :through => :article_tags
  
  def author_name
    self.author.full_name if self.author
  end
  
  def formatted_created_at
 	    self.created_at.strftime('%b %d') if self.created_at
  end
end