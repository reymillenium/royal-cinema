class Contact < ApplicationRecord

  require 'obscenity/active_model'

  # Validations:
  validates :name, presence: true

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :subject, presence: true
  validates :subject, obscenity: true

  validates :message, presence: true
  validates :message, obscenity: true

  private



end
