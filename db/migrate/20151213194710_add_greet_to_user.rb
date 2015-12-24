class AddGreetToUser < ActiveRecord::Migration
  def change
    add_column :users, :greet, :string
  end
end
