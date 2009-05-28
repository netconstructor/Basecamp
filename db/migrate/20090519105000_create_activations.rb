class CreateActivations < ActiveRecord::Migration
  def self.up
    create_table :activations do |t|
      t.integer :user_id
      t.string :activation_number
      t.string :activation_status
      t.timestamps
    end
  end

  def self.down
    drop_table :activations
  end
end
