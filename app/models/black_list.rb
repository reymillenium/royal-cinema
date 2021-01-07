class BlackList < ApplicationRecord

  # Validations:
  validates :value, presence: true
  validates :black_list_type, presence: true

end
