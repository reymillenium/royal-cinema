class Seat < ApplicationRecord

  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :auditorium, class_name: Auditorium.name, inverse_of: :seats
  has_many :seat_purchases, class_name: SeatPurchase.name, inverse_of: :seat, foreign_key: :seat_id, dependent: :destroy

  # Nested attributes:

  # Validations:
  validates :row_letter, presence: true
  validates :column_number, presence: true
  validates :base_value, presence: true

end
