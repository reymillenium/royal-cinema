class ApplicationController < ActionController::Base

  include Pagy::Backend

  layout :layout_by_resource

  ADMIN_RESOURCES = %w[contacts skills references samples]

  protect_from_forgery
  # before_action :authenticate_user!

  def layout_by_resource
    if devise_controller?
      'login'
    elsif ADMIN_RESOURCES.include?(controller_name)
      'admin_layout'
    else
      # For pages_controller (The visible website for any person, at pages/index)
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
