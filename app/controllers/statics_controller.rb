class StaticsController < ApplicationController

  def page
    @user = User.new
    @categories = Categorie.all
      if params[:categorie].present?
        @products = Categorie.find_by(name: params[:categorie]).products.paginate(page: params[:page])
      else
        @products = Product.paginate(page: params[:page])
      end
    respond_to do |format|
      format.js
      format.html
    end
  end
end
