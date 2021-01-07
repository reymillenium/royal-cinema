class Contact < ApplicationRecord

  require 'obscenity/active_model'

  # Validations:
  validates :name, presence: true

  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_is_not_blacklisted

  validates :subject, presence: true
  validates :subject, obscenity: true

  validates :message, presence: true
  validates :message, obscenity: true

  def email_blacklisted?
    BlackList.find_by_black_list_type_and_value("email", 'reymillenium@gmail.com').present?
  end

  private

  def email_is_not_blacklisted
    if Blacklist.find_by_black_list_type_and_value("email", self.email)
      errors.add(:email, 'is blacklisted')
    end
  end

end
