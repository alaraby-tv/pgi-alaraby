class CreateProductionCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :production_companies do |t|
      t.string :name
      t.string :contact_name
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
