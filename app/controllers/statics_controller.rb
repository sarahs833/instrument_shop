class StaticsController < ApplicationController
  before_action :current_cart,only:[:page]

  def page
    @user = User.new
    @categories = Categorie.all
    query = params[:search].presence || "*"
    conditions = {}
    conditions[:categorie_name] = params[:categorie] if params[:categorie].present?
    @products = Product.search query,where: conditions,fields:[:brand,:condition,:categorie_name],match: :word_start, page: params[:page], per_page: 8
    respond_to do |format|
      format.js
      format.html
    end
  end
end
