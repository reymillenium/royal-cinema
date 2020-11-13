class ContactService

  extend ContactsHelper

  # Params not desired to build/update a note object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a contact based on given parameters
  def self.build_contact(params)
    filtered_params = clean_parameters(params)
    contact = Contact.new(filtered_params)
    contact
  end

  # Cleans parameters not applicable to note attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end