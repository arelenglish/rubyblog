class Comment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :body, :commenter
  
  acts_as_textcaptcha   :api_key     => '6ssjenchqao0cc0ko4oo8wgkwbn930p0',
                             :bcrypt_salt => '$2a$10$7ZHhFliCIWigF7GF3rdtbu'
 
end
