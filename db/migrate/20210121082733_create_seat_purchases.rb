class CreateSeatPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :seat_purchases do |t|
      t.references :seat, foreign_key: { to_table: :seats }, index: true
      t.references :order, foreign_key: { to_table: :orders }, index: true
      t.string :row_letter
      t.string :column_number
      t.float :base_price
      t.boolean :was_used

      t.timestamps
    end
  end
end
