class CreateBroadcastingFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :broadcasting_frequencies do |t|
      t.string :regularity

      t.timestamps
    end
  end
end
