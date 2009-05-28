class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :message_id
      t.string :name
      t.string  :type_attachment
      t.string :size_attachment
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
