class AddDescriptionToTodolist < ActiveRecord::Migration
  def self.up
    add_column :todolists, :description, :text
  end

  def self.down
    remove_column :todolists, :description
  end
end
