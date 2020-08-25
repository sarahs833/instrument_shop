class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        flash[:success] = "please check your email to activate your account"
        redirect_to root_path
      else
        flash[:danger] = 'error: ' + @user.errors.full_messages.to_sentence
        redirect_to root_path
      end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
