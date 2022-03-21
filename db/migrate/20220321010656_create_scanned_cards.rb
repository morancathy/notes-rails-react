class CreateScannedCards < ActiveRecord::Migration[5.2]
  def change
    create_table :scanned_cards do |t|
      t.string :patient
      t.string :paying_company
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
