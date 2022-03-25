class CreateCardDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :card_details do |t|
      t.string :member_name
      t.string :member_number
      t.string :payer_name
      t.string :plan_id
      t.string :plan_name
      t.string :rx_bin
      t.string :rx_pcn
      t.string :rx_group
      t.string :dependents
      t.string :start_date
      t.string :card_specific_id
      t.string :group_number
      t.string :client_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
