class Order < ApplicationRecord

  # Constants:

  # Callbacks:

  # Relations:
  belongs_to :show_time, class_name: ShowTime.name, inverse_of: :orders
  has_many :available_seats, class_name: AvailableSeat.name, inverse_of: :order, foreign_key: :order_id, dependent: :destroy

  # Nested attributes:

  # Validations:
  validates :name, presence: true
  validates :email, presence: true
  validates :credit_card_number, presence: true
  validates :expiration_date, presence: true

end
