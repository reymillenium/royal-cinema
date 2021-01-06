class Sample < ApplicationRecord

  # Attachments
  has_one_attached :image, dependent: :destroy

  # Validations:
  validates :title, presence: true
  validates :sub_title, presence: true
  validates :url, presence: true

end
