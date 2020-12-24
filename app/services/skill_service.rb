class SkillService
  extend SkillsHelper

  # Params not desired to build/update a skill object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a contact based on given parameters
  def self.build_skill(params)
    filtered_params = clean_parameters(params)
    skill = Skill.new(filtered_params)
    skill
  end

  # Method to update a skill based on params descriptor
  def self.update_skill(params)
    skill = Skill.find(params[:id])
    filtered_params = clean_parameters(params)
    skill.assign_attributes(filtered_params)
    skill
  end

  # Cleans parameters not applicable to skill attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  private_class_method :clean_parameters
end