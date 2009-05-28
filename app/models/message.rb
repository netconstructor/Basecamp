class Message < ActiveRecord::Base
  belongs_to :proj
  belongs_to :user
  belongs_to :category
  has_many :attachments
  has_many :comments
  
  validates_presence_of :proj_id
  validates_presence_of :user_id
  
  def category_name
    if self.category.nil?
      return "no category"
    else
      return self.category.name
    end
  end
  
end
