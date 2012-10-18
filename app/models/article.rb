class Article < ActiveRecord::Base
    
  attr_accessible :body, :title, :author_id, :category_id, :tag_tokens
  belongs_to :author
  belongs_to :user
  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :article_tags, :dependent => :destroy
  has_many :tags, :through => :article_tags
  has_many :votes
  
    acts_as_textcaptcha   :api_key     => '6ssjenchqao0cc0ko4oo8wgkwbn930p0',
                          :bcrypt_salt => '$2a$10$7ZHhFliCIWigF7GF3rdtbu'
  
  validates_presence_of :title, :message => " - you need a title"
  validates_presence_of :body, :message => " -you have to write something in your post!"
   
  def author_name
    self.author.full_name if self.author
  end
  
  def formatted_created_at
 	    self.created_at.strftime('%a. %b %d at %I:%M%p') if self.created_at
  end
  
  def tag_tokens
   	self.tags.collect{|t| t.name}.join(", ")
  end
  
  def tag_tokens=(tags_delimited)
   	tags_delimited.split(",").each do |string|
        	self.article_tags.build(:tag => Tag.find_or_create_by_name(string.strip.downcase))
   	end   	
  end
  
  def upvote
    self.increment!(:up_votes)
  end
  
  def downvote
    self.decrement!(:down_votes)
  end
end
