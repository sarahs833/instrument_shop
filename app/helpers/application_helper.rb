module ApplicationHelper

  def current_cart
    if !session[:cart_id].nil?
     @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.new
      @current_cart.save
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end
