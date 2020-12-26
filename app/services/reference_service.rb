class ReferenceService
  extend ReferencesHelper

  # Params not desired to build/update a reference object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a reference based on given parameters
  def self.build_reference(params)
    filtered_params = clean_parameters(params)
    reference = Reference.new(filtered_params)
    reference
  end

  # Method to update a reference based on params descriptor
  def self.update_reference(params)
    reference = Reference.find(params[:id])
    filtered_params = clean_parameters(params)
    reference.assign_attributes(filtered_params)
    reference
  end

  # Cleans parameters not applicable to reference attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end