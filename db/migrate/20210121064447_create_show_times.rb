class CreateShowTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :show_times do |t|
      t.references :auditorium, foreign_key: { to_table: :auditoriums }, index: true
      t.references :movie, foreign_key: { to_table: :movies }, index: true
      t.datetime :begin_time
      t.datetime :end_time
      t.string :movie_title
      t.string :movie_genre
      t.float :price_per_seat

      t.timestamps
    end
  end
end
