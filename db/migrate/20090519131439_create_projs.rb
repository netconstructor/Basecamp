class CreateProjs < ActiveRecord::Migration
  def self.up
    create_table :projs do |t|
      t.integer :user_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :projs
  end
end
