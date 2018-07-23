class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_top_path
	  when User
	    user_path(current_user)
	  end
	end
end
