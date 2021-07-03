class SessionsController < ApplicationController
  include Autologin
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     auto_login(user)
      redirect_to qr_codes_path, notice: "Добро пожаловать #{current_user_name}"
    else 
      redirect_to new_user_path, alert: "Неверный email или пароль"
    end    
  end

  def destroy
     session.delete(:user_id) 
     redirect_to root_path, notice: "Вы завершили сеанс #{current_user_name}"
  end
end