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
  
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
