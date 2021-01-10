class AddCounterToMarketingMaterials < ActiveRecord::Migration[5.1]
  def up
    add_column :marketing_materials, :attachments_count, :integer
  end

  def down
    remove_column :marketing_materials, :attachments_count
  end
end
