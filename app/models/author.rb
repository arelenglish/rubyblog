class Author < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :twitter_handle
  has_many :articles
end
