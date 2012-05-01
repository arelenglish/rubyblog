class Category < ActiveRecord::Base
  attr_accessible :article_id, :name
  has_many :articles
end
