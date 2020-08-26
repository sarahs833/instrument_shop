class StaticsController < ApplicationController
  def page
    @user = User.new
    @products = Product.all
  end
end
