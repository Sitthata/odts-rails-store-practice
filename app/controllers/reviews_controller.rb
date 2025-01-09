class ReviewsController < ApplicationController
  before_action :set_product
  before_action :authenticate_user!, only: [ :create ]
  def create
    @review = @product.reviews.new(review_params)
    @review.user = current_user if user_signed_in

    if @review.save
      redirect_to @product, notice: "Thank you for your review!"
    else
      flash[:alert] = "Unable to add review"
      render "product/show"
    end
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
