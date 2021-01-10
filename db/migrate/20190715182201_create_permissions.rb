class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.references :user, foreign_key: true, index: true
      t.references :product, foreign_key: true, index: true
      t.boolean :can_edit_product, default: false
      t.boolean :can_add_new_episode, default: false

      t.timestamps
    end
  end
end
