class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email:params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "log in"
      redirect_to root_path
    end
    flash[:notice] = "user not found"
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
  end
end
