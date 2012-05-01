class Article < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :author
  belongs_to :category
  has_many :article_tags
  has_many :tags, :through => :article_tags
end
