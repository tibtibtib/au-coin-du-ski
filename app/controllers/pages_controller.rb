class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end
  def concept
  end 
  def my_bookings
  	
  end
  def my_products
  	
  end 
end
