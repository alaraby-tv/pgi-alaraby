class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :can_invite_new_user, default: false
      t.boolean :can_create_product, default: false
      t.boolean :can_view_all_products, default: false
      

      t.timestamps
    end
  end
end
