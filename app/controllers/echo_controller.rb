class EchoController < ApplicationController
  def index
    render json: { message: params[:message] }
  end
end
