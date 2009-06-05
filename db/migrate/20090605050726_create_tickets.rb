class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
	t.integer :proj_id
	t.integer :user_id
	t.integer :created_by
	t.text :ticket_desc
        t.integer :milestone_id	
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
