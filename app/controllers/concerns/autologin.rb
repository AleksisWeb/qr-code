module Autologin
  extend ActiveSupport::Concern

  def auto_login(user)
    session[:user_id] = user.id.to_s
  end
end