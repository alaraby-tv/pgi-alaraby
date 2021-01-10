class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :attainable, polymorphic: true, index: true
      t.references :presenter, foreign_key: true, index: true
      t.references :guest, foreign_key: true, index: true

      t.timestamps
    end
  end
end
