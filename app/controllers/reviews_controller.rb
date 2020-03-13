class ReviewsController < ApplicationController


  def create
    @review = Review.new(review_params)
    authorize @review
    @product = Product.find(params[:product_id])
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    else
      flash[:alert] = "Something went wrong."
      render 'products/show' 
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
