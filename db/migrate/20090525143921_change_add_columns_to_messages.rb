class ChangeAddColumnsToMessages < ActiveRecord::Migration
  def self.up
    rename_column :messages, :message_text, :title
    add_column :messages, :body, :text
  end

  def self.down
    rename_column :messages,  :title, :message_text
    remove_column :messages, :body
  end
end
