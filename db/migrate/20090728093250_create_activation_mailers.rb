class CreateActivationMailers < ActiveRecord::Migration
  def self.up
    create_table :activation_mailers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :activation_mailers
  end
end
