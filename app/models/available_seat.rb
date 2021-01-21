class AvailableSeat < ApplicationRecord
  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :seat, class_name: Seat.name, inverse_of: :AvailableSeat
  belongs_to :order, class_name: Order.name, inverse_of: :AvailableSeat

  # Nested attributes:

  # Validations:
  validates :row_letter, presence: true
  validates :column_number, presence: true
  validates :base_value, presence: true
  validates :was_used, presence: true

end
