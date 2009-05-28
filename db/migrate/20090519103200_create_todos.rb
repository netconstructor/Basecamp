class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :todo_text
      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
