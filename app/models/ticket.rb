class Ticket < ApplicationRecord

  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :order, class_name: Order.name, inverse_of: :ticket

  # Nested attributes:

  # Validations:
  validates :test, presence: true

end
