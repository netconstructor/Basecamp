class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :message_id
      t.integer :todo_id
      t.string :comment_text
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
