class Auditorium < ApplicationRecord
  # Fixing issue due to wrong pluralization of the framework of the word auditorium (the table 'auditoria' was initially assigned)
  # self.table_name = "auditoriums"

  # Constants:

  # Callbacks:

  # Relations:
  has_many :seats, class_name: Seat.name, inverse_of: :auditorium, foreign_key: :auditorium_id, dependent: :destroy
  has_many :show_times, class_name: ShowTime.name, inverse_of: :auditorium, foreign_key: :auditorium_id


  # Nested attributes:

  # Validations:
  validates :name, presence: true

end
