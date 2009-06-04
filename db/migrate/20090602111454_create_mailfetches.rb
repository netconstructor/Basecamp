class CreateMailfetches < ActiveRecord::Migration
  def self.up
    create_table :mailfetches do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :mailfetches
  end
end
