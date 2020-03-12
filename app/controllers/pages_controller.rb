class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :concept]
  def home
    @naked_navbar = true
  end

  def concept
    @naked_navbar = true
  end

  def my_bookings
    @my_bookings = current_user.bookings
  end

  def my_products
    @my_products = current_user.products
  end
  def bookings_on_my_products
  end
end
