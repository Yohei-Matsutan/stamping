class Stamp < ApplicationRecord
	belongs_to :user
	has_many :stamp_logs

	def view_in_time
		# sprintf("%02d")で0埋め表示
		hour = sprintf("%02d", in_time.hour)
		min = sprintf("%02d", in_time.min)
		hour + ':' + min
	end

	def view_out_time
		hour = sprintf("%02d", out_time.hour)
		min = sprintf("%02d", out_time.min)
		hour + ':' + min
	end
	
	def work_hour
		# work_secにintegerで総労働秒を入れて、strftime('%R')で時：分に変換
		work_sec = (out_time - in_time).floor
		Time.at(work_sec).utc.strftime('%R')
	end
end
