class LineitemsController < ApplicationController

  def create
    @cart = current_cart
    @product = Product.find(params[:product_id])
    @line_item = @cart.add_items(@product)
    if @line_item.save
      session[:cart_id] = @cart.id
      redirect_to @cart
    else
      flash[:danger] = 'can/t add item'
      redirect_to root_path
    end
  end

  def destroy
    @line_item = Lineitem.find(params[:id])
    @item = @line_item.check_quantity
    @item.save
    @cart = current_cart
    redirect_to @cart
  end


end
