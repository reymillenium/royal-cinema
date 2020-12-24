class ApplicationController < ActionController::Base

  include Pagy::Backend

  layout :layout_by_resource

  ADMIN_RESOURCES = %w[contacts skills]

  protect_from_forgery
  # before_action :authenticate_user!


  def layout_by_resource
    if devise_controller?
      'login'
    elsif ADMIN_RESOURCES.include?(controller_name)
      'contacts'
    else
      'application'
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    contacts_path
  end

  def after_sign_out_path_for(resource_or_scope)
    pages_path
  end

end
