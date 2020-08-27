class ProductsController < ApplicationController
  before_action :check_user, only:[:edit,:update,:destroy]
  def index
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @categorie = Categorie.with_name
  end

  def create
    @product = current_user.products.new(params_product)
    @product.image.attach(params[:product][:image])
    if @product.save
      redirect_to @product
    else
      flash[:notice] = 'product not saved'
      render 'new'
    end
  end

  def edit

  end

  def update
    @product.update(params_product)
    redirect_to root_path
  end

  def destroy
  end

  def check_user
    @product = Product.find(params[:id])
   redirect_to root_path,notice: "not permitted" unless current_user.products.include?(@product)
  end

  private

  def params_product
    params.require(:product).permit(:brand,:price,:categorie_id,:image)
  end
end
