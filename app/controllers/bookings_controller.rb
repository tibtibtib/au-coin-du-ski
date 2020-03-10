class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @seller = @booking.product.user
    @buyer = @booking.user
    @time = @booking.product.end_date - @booking.product.start_date
  end
end
