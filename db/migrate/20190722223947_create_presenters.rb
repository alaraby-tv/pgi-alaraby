class CreatePresenters < ActiveRecord::Migration[5.1]
  def change
    create_table :presenters do |t|
      t.string :name

      t.timestamps
    end
  end
end
