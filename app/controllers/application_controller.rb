class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :admin_login_layout

  def admin_login_layout
    if devise_controller? && resource_name == :admin && (is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::PasswordsController))
      'admin_login'
    else
      'application'
    end
  end
end
