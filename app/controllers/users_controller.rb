class UsersController < ApplicationController
	def main
		@user = current_user
		@stamps = @user.stamps
	end

	def index
	end
end
