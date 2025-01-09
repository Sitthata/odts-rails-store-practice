class ReviewsController < ApplicationController
  before_action :set_product
  before_action :require_authentication, only: [ :create ]
  def create
    @review = @product.reviews.new(review_params)
    @review.user = Current.session&.user

    if @review.save
      redirect_to @product, notice: "Thank you for your review!"
    else
      flash[:alert] = "Unable to add review"
      render "products/show"
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
