class CreateAttachmentEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :attachment_emails do |t|
      t.string :email
      t.boolean :on_creation, default: false
      t.boolean :on_delete, default: false

      t.timestamps
    end
  end
end
