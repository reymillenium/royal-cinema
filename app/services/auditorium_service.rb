class AuditoriumService
  extend AuditoriumsHelper

  # Params not desired to build/update a auditorium object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a contact based on given parameters
  def self.build_auditorium(params)
    filtered_params = clean_parameters(params)
    auditorium = Auditorium.new(filtered_params)
    auditorium
  end

  # Method to update a auditorium based on params descriptor
  def self.update_auditorium(params)
    auditorium = Auditorium.find(params[:id])
    filtered_params = clean_parameters(params)
    auditorium.assign_attributes(filtered_params)
    auditorium
  end

  # Cleans parameters not applicable to auditorium attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end