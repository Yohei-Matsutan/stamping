class StampsController < ApplicationController
  def clock_in
    Stamp.create(in_time: Time.now, user_id: current_user.id )

    #userのpatchの内容だし、redirecttoでcontrollerを移った方がいいのかな
    user = current_user
    user.update(is_on_duty: true)

    redirect_to users_main_path
  end

  def clock_out
    stamp = Stamp.find_by(user_id: current_user.id, out_time: nil)
    stamp.update(out_time: Time.now)

    user = current_user
    user.update(is_on_duty: false)

    redirect_to users_main_path
  end

  def show
    @stamp = Stamp.find(params[:id])
  end

  def edit
    @stamp = Stamp.find(params[:id])
  end

  def update
    stamp = Stamp.find(params[:id])
    # 古い情報をログに記録
    @stamp_log = StampLog.new
    @stamp_log.stamp_id = stamp.id
    @stamp_log.user_id = current_user.id
    @stamp_log.old_in_time = stamp.in_time
    @stamp_log.old_out_time = stamp.out_time

    # 更新後、情報をログに記録、保存
    stamp.update(stamp_params)
    @stamp_log.new_in_time = stamp.in_time
    @stamp_log.new_out_time = stamp.out_time
    @stamp_log.save
    
    flash[:edited] = '編集が完了しました。'
    redirect_to user_path(stamp.user_id)
  end

  def destroy
    stamp = Stamp.find(params[:id])
    stamp.delete
    flash[:deleted] = '記録を削除しました。'
    redirect_to user_path(stamp.user_id)
  end

  private
  
  def stamp_params
    params.require(:stamp).permit(:in_time, :out_time)
  end
end
