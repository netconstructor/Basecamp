class AddListOrderToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :list_order, :integer, :default=>0
  end

  def self.down
    remove_column :todos, :list_order
  end
end
