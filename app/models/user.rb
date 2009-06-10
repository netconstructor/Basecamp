class User < ActiveRecord::Base
  include AASM
  
  # Authorization plugin
      acts_as_authorized_user
      acts_as_authorizable
  
  
  has_many :projs
  has_many :todolists
  has_many :todos
  has_many :tickets
  has_many :messages
  has_many :milestones
  has_many :comments
  has_one :activation
  belongs_to :department
  has_many :users_projs
  
  validates_uniqueness_of :username
  
  aasm_column :admin
  aasm_initial_state :not_admin
  
  aasm_state :admin
  aasm_state :not_admin
  
  aasm_event :setadmin do
    transitions :to => :admin, :from => [:not_admin]
  end
  
  aasm_event :remove_admin do
    transitions :to => :not_admin, :from => [:admin]
  end
  
  def self.list_of_users_not_in_proj(proj)
    users=[]
    User.find(:all).each do |user|
      if (user.isadmin) || (!user.users_projs.nil? && !user.users_projs.find_by_proj_id(proj.id).nil? )
      else
        users << user
      end
    end
    return users
  end
  
  def list_projects
    projs=[]
    self.users_projs.each do |user_proj|
      projs << user_proj.proj
    end
    return projs
  end
  
  def has_all_completed_todos
    if self.todos.incomplete_todo.size==0
      return true
    else
      return false
    end
  end
  
  def incomplete_todos(todolist)
    return self.todos.incomplete_todo.find(:all,:conditions=>{:todolist_id=>todolist.id })
  end
  
  def self.list_of_users
    users=[]
    User.find(:all).each do |user|
      if user.username=="admin"
      else
        users << user
      end
    end
    return users
  end
  
  def isadmin
    return self.admin=="admin" ?  true : false
  end
  
  def self.authenticate(login, pass)
    find(:first,:conditions => ["username = ? AND password = ?", login, sha1(pass)])
  end
  
  
  protected

  def self.sha1(pass)
    Digest::SHA1.hexdigest(pass)
  end
    
  before_create :crypt_password
  
  def crypt_password
    write_attribute("password", self.class.sha1(password))
  end
  
end
