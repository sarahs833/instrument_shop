class StaticsController < ApplicationController
  def page
    @user = User.new
    @products = Product.paginate(page: params[:page])
  end
end
