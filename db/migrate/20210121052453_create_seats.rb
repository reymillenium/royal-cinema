class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.references :auditorium, foreign_key: { to_table: :auditoriums }, index: true
      t.string :row_letter
      t.string :column_number
      t.float :base_price

      t.timestamps
    end
  end
end
