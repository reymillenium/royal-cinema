class Seat < ApplicationRecord

  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :auditorium, class_name: Auditorium.name, inverse_of: :seats

  # Nested attributes:

  # Validations:
  validates :row_letter, presence: true
  validates :column_number, presence: true
  validates :base_value, presence: true

end
