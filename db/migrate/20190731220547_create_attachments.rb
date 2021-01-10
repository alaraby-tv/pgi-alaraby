class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :file_attached
      t.string :notes
      t.references :marketing_material, foreign_key: true, index: true
      t.references :user

      t.timestamps
    end
  end
end
