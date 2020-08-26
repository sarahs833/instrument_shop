class SessionsController < ApplicationController

  def create
    @user = User.find_by(email:params[:session][:email])
    if @user && @user.activated? && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "log in"
      redirect_to root_path
    else
      flash[:danger] = 'user not found'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id) if !session[:user_id].nil?
    redirect_to root_path
  end
end
