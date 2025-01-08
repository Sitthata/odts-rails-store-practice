class UnsubscribesController < ApplicationController
  def show
  end

  private
  def set_subscriber
    @subscriber = Subscriber.find_by_token_for(:unsubscribe, params[:token])
  end
end
