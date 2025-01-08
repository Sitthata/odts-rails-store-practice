class SubscriberController < ApplicationController
  allow_unauthenticated_access
  def create
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def subscriber_param
    params.expect(subscriber: [ :email ])
  end
end
