class UsersController < ApplicationController
	def main
		@user = current_user
		@stamps = @user.stamps
	end

	def index
		if current_user.is_admin
			@users = User.all
		else
			flash[:failure] = '管理者として認証されていません。申請をお願いします。'
			redirect_to users_main_path
		end
	end
end
