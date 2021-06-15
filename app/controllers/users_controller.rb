class UsersController < ApplicationController
  def new
  @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id.to_s
      redirect_to qr_codes_path, notice: "Пользователь создан"
    else
      redirect_to new_user_path, alert: "Пользователь не был создан"
    end
  end
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
        )
  end
end