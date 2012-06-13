class Article < ActiveRecord::Base
    
  attr_accessible :body, :title, :author_id, :category_id, :tag_tokens
  belongs_to :author
  belongs_to :user
  belongs_to :category
  has_many :article_tags, :dependent => :destroy
  has_many :tags, :through => :article_tags
  has_many :votes 
  
  validates_presence_of :title, :body
 
  # perform a paginated query:
  # def self.all_or_search(params)
  #         if params[:q].present?
  #           self.starts_with(params[:q]).page(params[:page])
  #         else
  #           self.paginate(:page => params[:page])
  #         end
  #       end
   
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
end
