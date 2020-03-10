class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_product, only: [:create]
  def show
    @product = @booking.product
    @seller = @booking.product.user
    @buyer = @booking.user
    @time = @booking.end_date - @booking.start_date
    authorize @booking
  end

  def new; end

  def create
    @booking = Booking.new(params_booking)
    authorize @booking
    @booking.product = @product
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'products/show'
    end
  end

  def destroy
    authorize @booking
    @booking.destroy

    redirect_to products_path
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
