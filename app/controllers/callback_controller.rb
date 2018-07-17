class CallbackController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @events = Event.new(webhook_params)
    render json: {success: true}, status: :ok
  end

private
  def webhook_params
    params.permit(:events)
  end
end
