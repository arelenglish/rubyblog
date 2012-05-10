class User < ActiveRecord::Base
  attr_accessible :username
    has_secure_password
end
