class CreateJoinTableBroadcastMediaProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :broadcast_media, :products do |t|
      t.index :broadcast_medium_id
      t.index :product_id
    end
  end
end
