class RenameColumnProjectProjInTodos < ActiveRecord::Migration
  def self.up
    rename_column :todos, :project_id, :proj_id
  end

  def self.down
    rename_column :todos, :proj_id, :project_id
  end
end
