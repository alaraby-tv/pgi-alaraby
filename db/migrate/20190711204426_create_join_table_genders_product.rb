class CreateJoinTableGendersProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :genders, :products do |t|
      t.index :gender_id
      t.index :product_id
    end
  end
end
