class SampleService
  extend SamplesHelper

  # Params not desired to build/update a sample object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a contact based on given parameters
  def self.build_sample(params)
    filtered_params = clean_parameters(params)
    sample = Sample.new(filtered_params)
    sample
  end

  # Method to update a sample based on params descriptor
  def self.update_sample(params)
    sample = Sample.find(params[:id])
    filtered_params = clean_parameters(params)
    sample.assign_attributes(filtered_params)
    sample
  end

  # Cleans parameters not applicable to sample attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end