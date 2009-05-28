class ChangeColumnTodoText < ActiveRecord::Migration
  def self.up
    change_column :todos, :todo_text, :text 
  end

  def self.down
     change_column :todos, :todo_text,  :string 
  end
end
