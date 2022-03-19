class ApplicationController < ActionController::Base
	# devise controllerのactionの前にconfigure_permitted_parameters(protected以下)を実行
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		users_main_path
	end
	def after_sign_up_path_for(resource)
		users_main_path
	end
	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	# sign_up時にnameのデータ操作を許可する
	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
