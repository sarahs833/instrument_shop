class ApplicationController < ActionController::Base
 include ApplicationHelper

 before_action :current_cart
 before_action :current_user
 helper_method :current_user
 helper_method :current_cart

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def is_login?
    !current_user.nil?
  end

end
