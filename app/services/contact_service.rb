class ContactService

  require 'sendgrid-ruby'
  include SendGrid
  extend ContactsHelper

  # Params not desired to build/update a contact object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a contact based on given parameters
  def self.build_contact(params)
    filtered_params = clean_parameters(params)
    contact = Contact.new(filtered_params)
    contact
  end

  def self.send_email(contact)
    from = Email.new(email: contact.email)
    to = Email.new(email: 'reymillenium@gmail.com')
    subject = contact.subject
    content = Content.new(type: 'text/plain', value: contact.message)
    mail = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: Figaro.env.sendgrid_api_key)
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response
  end

  # Cleans parameters not applicable to contact attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end