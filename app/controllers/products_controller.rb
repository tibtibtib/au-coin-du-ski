class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @products = policy_scope(Product).search_by_name_and_description(params[:query])
      if params[:start_date].present? || params[:end_date].present?
        if params[:start_date].present? && params[:end_date].present?
          sql = ":end_date >= start_date and end_date >= :start_date"
          @products = @products.reject do |product|
            product.bookings.where(sql, start_date: params[:start_date], end_date: params[:end_date]).exists?
          end
        else
          redirect_to root_path
        end
      end
    else
      @products = policy_scope(Product)
    end
  end

  def show
    @booking = Booking.new
    authorize @product
    @review = Review.new
    authorize @review

    if @product.geocoded?
      @marker = {
        lat: @product.latitude,
        lng: @product.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { product: @product })
      }
    end
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
