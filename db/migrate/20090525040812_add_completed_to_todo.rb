class AddCompletedToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :completed, :string, :default=>"not_completed"
  end

  def self.down
    remove_column :todos, :completed
  end
end
