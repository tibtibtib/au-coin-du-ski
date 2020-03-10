class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def concept
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

  def my_products
    @my_products = current_user.products
  end
end
