class Auditorium < ApplicationRecord


  # Constants:

  # Callbacks:

  # Relations:
  has_many :seats, class_name: Seat.name, inverse_of: :auditorium, foreign_key: :auditorium_id, dependent: :destroy


  # Nested attributes:

  # Validations:
  validates :name, presence: true

end
