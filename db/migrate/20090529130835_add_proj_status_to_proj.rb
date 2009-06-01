class AddProjStatusToProj < ActiveRecord::Migration
  def self.up
    add_column :projs, :proj_status, :string, :default => "Initialised"
  end

  def self.down
    remove_column :projs, :proj_status
  end
end
