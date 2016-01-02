class AddColumnToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :retweetid, :integer
  end
end
