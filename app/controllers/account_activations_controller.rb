class AccountActivationsController < ApplicationController

  def edit
    @user = User.find_by(email:params[:email])
    if @user && !@user.activated? && @user.authenticated?(:activation,params[:id])
      @user.update(activated: true, activated_at: Time.zone.now)
      login(@user)
      flash[:success] = 'your account has been activate'
      redirect_to root_path
    else
      flash[:danger] = 'something went wrong'
      redirect_to root_path
    end
  end
end
