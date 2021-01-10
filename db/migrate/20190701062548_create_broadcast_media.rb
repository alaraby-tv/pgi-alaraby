class CreateBroadcastMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :broadcast_media do |t|
      t.string :name

      t.timestamps
    end
  end
end
