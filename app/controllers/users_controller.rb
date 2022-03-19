class UsersController < ApplicationController
	def main
		@user = current_user
	end

	def index
	end
end
