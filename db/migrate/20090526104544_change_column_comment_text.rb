class ChangeColumnCommentText < ActiveRecord::Migration
  def self.up
    change_column :comments, :comment_text, :text
  end

  def self.down
    change_column :comments, :comment_text, :string
  end
end
