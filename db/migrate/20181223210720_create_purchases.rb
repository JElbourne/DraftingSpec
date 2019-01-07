class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.string :stripe_charge_id
      t.integer :amount_in_cents
      t.string :card_last4
      t.integer :card_exp_month
      t.integer :card_exp_year
      t.string :card_type

      t.timestamps
    end
  end
end
