class CallbackController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    binding.pry
    @events = Event.new(webhook_params, request.headers["x-line-signature"], request.body.read)
    if @events.valid?
      @events.response
      render json: {success: true}, status: :ok
    else
      render json: {errors: @events.errors}, status: :unprocessable_entity
    end
  end

private
  def webhook_params
    params.require(:events)
  end
end
