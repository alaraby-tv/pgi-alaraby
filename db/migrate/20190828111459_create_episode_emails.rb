class CreateEpisodeEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :episode_emails do |t|
      t.string :email
      t.boolean :on_creation, default: false
      t.boolean :on_update, default: false

      t.timestamps
    end
  end
end
