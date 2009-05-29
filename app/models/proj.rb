
class Proj < ActiveRecord::Base

  has_many :messages
  has_many :todolists
  has_many :todos
  belongs_to :user
  has_many :users_projs
  has_many :milestones

  validates_presence_of :user_id 
  validate :owner_exists
  validate :owner_is_an_admin
  validates_uniqueness_of :name
  
  def owner_exists
    errors.add(:user_id, "user with such id doesnt exist") if  (!User.find(self.user_id))
  end
  
  def self.items
    items=[]
    Proj.list_todos.each do |todo|
      temp_obj=Item.new(:id=>todo.id)
      items << temp_obj
    end
    return items
  end
  
  def list_todos
    todos=[]
    self.todolists.each do |todolist|
      todos + todolist.todos
    end
    return todos
  end
  
  def owner_is_an_admin
    errors.add(:user_id, "You shoud be an admin to be able to create a project") if  (!self.user.isadmin)
  end
  
  def members_list
    members=[]
    @users_projs=self.users_projs
    @users_projs.each do |user_proj|
      members << user_proj.user
    end
    return members
  end
  after_save :set_owner_members_list
  def set_owner_members_list
    proj_id=self.id
    user_id=self.user.id
    userproj=UsersProj.new({:proj_id=>proj_id,:user_id=>user_id})
    userproj.save
  end
  
end
