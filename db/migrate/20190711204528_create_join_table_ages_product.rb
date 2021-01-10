class CreateJoinTableAgesProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ages, :products do |t|
      t.index :age_id
      t.index :product_id
    end
  end
end
