class CreateViewingForms < ActiveRecord::Migration[5.1]
  def change
    create_table :viewing_forms do |t|
      t.references :user, foreign_key: true, index: true
      t.references :viewable, polymorphic: true, index: true
      t.string :contact_number
      t.string :programme_id
      t.string :ingest_date
      t.string :tx_date
      t.string :aspect_ratio

      t.timestamps
    end
  end
end
