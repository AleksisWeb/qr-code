class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id.to_s
      redirect_to qr_codes_path, notice: "Добро пожаловать"
    else 
      redirect_to new_user_path, alert: "Неверный email или пароль"
    end    
  end

  def destroy
     session.delete(:user_id) 
     redirect_to root_path, notice: "Вы завершили сеанс"
  end
end