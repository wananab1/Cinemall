class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  add_flash_types :success, :info, :warning, :danger


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  def set_search
  	@q = Movie.search(params[:q])
  	@p = Person.search(params[:q])
  	# @p = Person.search(params[:q])
  end

  def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admins_top_path
	  when User
	    user_timeline_path(current_user)
	  end
	end

  def access_admin
     unless   admin_signed_in?
        flash[:danger] = "管理者としてのログインが必要です"
        if user_signed_in?
          redirect_to user_path(current_user)
        else
         redirect_to("/")
        end
     end
  end
end
