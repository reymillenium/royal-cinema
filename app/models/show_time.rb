class ShowTime < ApplicationRecord
  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :auditorium, class_name: Auditorium.name, inverse_of: :show_times
  belongs_to :movie, class_name: Movie.name, inverse_of: :show_times
  has_many :orders, class_name: Order.name, inverse_of: :show_time, foreign_key: :show_time_id, dependent: :destroy

  # Nested attributes:

  # Validations:
  validates :begin_time, presence: true
  validates :end_time, presence: true
  validates :movie_title, presence: true
  validates :movie_genre, presence: true
  validates :price_per_seat, presence: true
end
