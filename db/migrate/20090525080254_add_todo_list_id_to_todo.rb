class AddTodoListIdToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :todolist_id, :integer
  end

  def self.down
    remove_column :todos, :todolist_id
  end
end
