class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_user_info


	def get_user_info
   		@user_role = "Coordonnateur"
   		@user_id = 1
	end
end
