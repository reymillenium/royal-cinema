# frozen_string_literal: true

class Skill < ApplicationRecord

  # Validations:
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :color, presence: true
  validates :percentage, presence: true
  validates :percentage, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

end
