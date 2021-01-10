class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.references :product, foreign_key: true, index: true
      t.references :production_company, foreign_key: true, index: true
      t.string :episode_number
      t.string :po
      t.string :english_title
      t.string :arabic_title
      t.string :topic
      t.text :description
      t.string :production_region
      t.string :first_shooting_date
      t.boolean :subtitled
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
