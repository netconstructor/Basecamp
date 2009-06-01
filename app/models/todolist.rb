class Todolist < ActiveRecord::Base
  belongs_to :proj
  has_many :todos
  
  default_scope :conditions => { :removed => false}
  named_scope :completed_todolist, :conditions => {:completed => "completed"}
  
  def iscompleted
    if self.todos.size!=0 && (self.todos.size == self.todos.count(:conditions=>{:completed=>"completed"}))
      return true
    else
      return false
    end
  end
  
  def list_completed
    return 
  end
  
  
  def completed_todos
    return self.todos.completed_todo
  end
  def incomplete_todos
    return self.todos.incomplete_todo
  end
  
end
