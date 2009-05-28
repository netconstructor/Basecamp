class Todolist < ActiveRecord::Base
  belongs_to :proj
  has_many :todos
  
  def iscompleted
    if self.todos.size!=0 && (self.todos.size == self.todos.count(:conditions=>{:completed=>"completed"}))
      return true
    else
      return false
    end
  end
  
  def completed_todos
    return self.todos.find(:all,:conditions=>{:completed=>"completed"})
  end
  def incomplete_todos
    return self.todos.find(:all,:conditions=>{:completed=>"not_completed"})
  end
  
end
