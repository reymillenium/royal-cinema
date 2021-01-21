class CreateAvailableSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :available_seats do |t|
      t.references :show_time, foreign_key: { to_table: :show_times }, index: true
      t.references :order, foreign_key: { to_table: :orders }, index: true
      t.string :row_letter
      t.string :column_number
      t.float :base_price
      t.boolean :was_used

      t.timestamps
    end
  end
end
