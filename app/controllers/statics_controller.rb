class StaticsController < ApplicationController

  def page
    if params[:categorie].present?
      @user = User.new
      @products = Categorie.find_by(name: params[:categorie]).products.paginate(page: params[:page])
      @categories = Categorie.all
    else
      @user = User.new
      @products = Product.paginate(page: params[:page])
      @categories = Categorie.all
    end
  end
end
