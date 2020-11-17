class Contact < ApplicationRecord

  # Validations:
  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :subject, presence: true
  validates :message, presence: true

end
