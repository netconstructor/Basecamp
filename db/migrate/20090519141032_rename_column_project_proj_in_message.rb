class RenameColumnProjectProjInMessage < ActiveRecord::Migration
  def self.up
    rename_column :messages, :project_id, :proj_id
  end

  def self.down
    rename_column :messages, :proj_id, :project_id
  end
end
