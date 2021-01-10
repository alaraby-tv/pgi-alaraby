class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :product_type
      t.references :user
      t.references :production_company
      t.string :po
      t.string :logo
      t.string :english_title
      t.string :arabic_title
      t.text :full_description
      t.string :short_description
      t.integer :number_of_episodes
      t.integer :season
      t.references :duration
      t.string :production_region
      t.string :production_year
      t.string :broadcasting_year
      t.string :first_shooting_date
      t.boolean :subtitled
      t.references :broadcasting_frequency
      t.string :broadcasting_date
      t.string :broadcasting_time
      t.string :status
      t.text :format_and_structure
      t.text :programme_benchmark
      t.text :marketing_message_ideas
      t.references :nature
      t.references :category
      t.references :genre
      t.references :department


      t.timestamps
    end
  end
end
