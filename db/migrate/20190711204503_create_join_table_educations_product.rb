class CreateJoinTableEducationsProduct < ActiveRecord::Migration[5.1]
  def change
    create_join_table :educations, :products do |t|
      t.index :education_id
      t.index :product_id
    end
  end
end
