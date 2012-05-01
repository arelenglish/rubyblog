class ArticleTag < ActiveRecord::Base
  attr_accessible :article_id, :tag_id
  belongs_to :articles
  belongs_to :tags
end
