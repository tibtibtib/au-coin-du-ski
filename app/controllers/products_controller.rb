class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :category, :address, :price)
  end

end