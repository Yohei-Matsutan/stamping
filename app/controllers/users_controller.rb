require 'csv'
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

	def show
		@user = User.find(params[:id])
		@stamps = @user.stamps

		respond_to do |format|
			format.html
			format.csv do |csv|
			  send_stamps_csv(@stamps)
			end
		end
	end

	def authorize
		if current_user.is_admin
			user = User.find(params[:id])
			tf = !user.is_admin
			user.update(is_admin: tf)
			redirect_to users_path
		else
			flash[:failure] = '管理者として認証されていません。申請をお願いします。'
			redirect_to users_main_path
		end
	end

	def send_stamps_csv(stamps)
		csv_data = CSV.generate(row_sep: "\r\n", encoding:Encoding::CP932)  do |csv|
		  header = %w(名前 出勤時間 退勤時間 勤務時間)
		  csv << header
		  stamps.each do |stamp|
			values = [stamp.user.name, stamp.in_time, stamp.out_time, stamp.work_hour]
			csv << values
		  end
		end
		send_data(csv_data, filename: "stamps.csv")
	end
end
