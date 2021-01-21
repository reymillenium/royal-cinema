class AvailableSeat < ApplicationRecord
  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :show_time, class_name: ShowTime.name, inverse_of: :available_seats
  belongs_to :order, class_name: Order.name, inverse_of: :available_seats

  # Nested attributes:

  # Validations:
  validates :row_letter, presence: true
  validates :column_number, presence: true
  validates :base_value, presence: true
  validates :was_used, presence: true

end
