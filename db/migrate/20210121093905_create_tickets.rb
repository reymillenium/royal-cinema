class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :order, foreign_key: { to_table: :orders }, index: true
      t.string :serial
      t.datetime :begin_date
      t.string :cinema_name
      t.string :auditorium_name
      t.float :total_price
      t.string :movie_title
      t.string :seats_string

      t.timestamps
    end
  end
end
