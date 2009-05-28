class Comment < ActiveRecord::Base
  belongs_to :message
  belongs_to :todo
  belongs_to:user
  
  validates_presence_of :message_id
  validates_presence_of :todo_id
  validates_presence_of :user_id
  validates_presence_of :comment_text
end
