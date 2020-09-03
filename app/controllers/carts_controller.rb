class CartsController < ApplicationController

  def show
    @user = User.new
    @cart = Cart.find(session[:cart_id])
  end


  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    flash[:success] = 'Cart has been successfully destroyed!'
    redirect_to root_path
  end
end
