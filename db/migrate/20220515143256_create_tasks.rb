class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, default: false

      t.timestamps
    end
  end
end
