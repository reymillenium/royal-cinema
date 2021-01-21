class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :creation_year
      t.float :price_per_seat

      t.timestamps
    end
  end
end
