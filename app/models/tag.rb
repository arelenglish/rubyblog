class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :article_tags
  has_many :articles, :through => :article_tags
end
