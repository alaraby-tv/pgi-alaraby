class CreateJoinTableProductRegions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :regions do |t|
      t.index :product_id
      t.index :region_id
    end
  end
end
