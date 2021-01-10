class CreateMarketingMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :marketing_materials do |t|
      t.string :name
      t.string :readiness_date
      t.references :marketable, polymorphic: true, index: true
      t.references :material_type
      t.references :user

      t.timestamps
    end
  end
end
