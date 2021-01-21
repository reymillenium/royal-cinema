class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :show_time, foreign_key: { to_table: :show_times }, index: true
      t.string :name
      t.string :email
      t.integer :credit_card_number
      t.date :expiration_date

      t.timestamps
    end
  end
end
