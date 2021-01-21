class Movie < ApplicationRecord
  # Constants:

  # Callbacks:

  # Relations:
  has_many :show_times, class_name: ShowTime.name, inverse_of: :movie, foreign_key: :movie_id

  # Nested attributes:

  # Validations:
  validates :title, presence: true
  validates :genre, presence: true
  validates :creation_year, presence: true
  validates :price_per_seat, presence: true

end
