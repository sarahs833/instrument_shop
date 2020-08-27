class StaticsController < ApplicationController

  def page
    @user = User.new
    @categories = Categorie.all
    query = params[:search].presence || "*"
    conditions = {}
    conditions[:categorie_name] = params[:categorie] if params[:categorie].present?
    @products = Product.search query,where: conditions,match: :word_start, page: params[:page], per_page: 6
    respond_to do |format|
      format.js
      format.html
    end
  end
end
