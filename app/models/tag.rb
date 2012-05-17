class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :article_tags, :dependent => :destroy
  has_many :articles, :through => :article_tags
  
  validates_presence_of :name, :on => :create
  validates :name, :uniqueness => true
     
  def formatted_created_at
    self.created_at.strftime('%b %d') if self.created_at
  end
end
