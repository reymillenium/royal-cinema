class Reference < ApplicationRecord

  # Trix ActionText
  has_rich_text :letter

  #  Relations
  has_one :action_text_rich_text,
          class_name: 'ActionText::RichText',
          as: :record

  # Validations:
  validates :full_name, presence: true
  validates :current_job_title, presence: true
  validates :linkedin_profile, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, allow_nil: true }

end
