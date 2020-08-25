class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user && @user.activated?
       @user.set_reset_digest
       @user.save
       @user.send_reset_password
       flash[:notice] = 'please check your email to reset password'
       redirect_to root_path
    else
      flash[:danger] = 'user not found'
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @user = @user.find_by(email: params[:email])
    if @user && @user.activated? && @user.authenticated?(:reset, params[:id])
       @user.update(user_params)
       @user.update(reset_sent_at: Time.zone.now)
       login(@user)
       flash[:success] = "password has been reset"
       redirect_to root_path
    else
      flash[:danger] = 'something went wrong'
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:password)
  end


end
