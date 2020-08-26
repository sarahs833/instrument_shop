class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      if !@user.activated?
         flash[:danger] = 'You need to activate your email before changing the password'
         redirect_to root_path
      else
         @user.set_reset_digest
         @user.save
         @user.send_reset_password
         flash[:notice] = 'Please check your email to reset password'
         redirect_to root_path
      end
    else
      flash[:danger] = 'user not found'
      redirect_to root_path
    end
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.find_by(email: params[:email])
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
    params.require(:user).permit(:password,:password_confirmation)
  end


end
