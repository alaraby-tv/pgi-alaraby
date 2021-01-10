class CreateDurations < ActiveRecord::Migration[5.1]
  def change
    create_table :durations do |t|
      t.integer :length_in_minutes

      t.timestamps
    end
  end
end
