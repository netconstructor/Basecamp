class UsersProj < ActiveRecord::Base
  belongs_to :user
  belongs_to :proj
end
