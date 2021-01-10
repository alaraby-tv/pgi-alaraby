class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.references :viewing_form, foreign_key: true, index: true
      t.string :in
      t.string :out
      t.string :duration
      t.string :note

      t.timestamps
    end
  end
end
