class CreateUsersProjs < ActiveRecord::Migration
  def self.up
    create_table :users_projs do |t|
      t.integer :user_id
      t.integer :proj_id
      t.timestamps
    end
  end

  def self.down
    drop_table :users_projs
  end
end
