class AddMemoToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :memo, :string
  end
end
