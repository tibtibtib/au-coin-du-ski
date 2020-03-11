class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = policy_scope(Product)
  end

  def show
    @booking = Booking.new
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit
    authorize @product
  end

  def update
    authorize @product
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to(products_path)
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :category, :address, :price, photos: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
