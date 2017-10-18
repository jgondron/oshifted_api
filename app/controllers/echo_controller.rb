class EchoController < ApplicationController
  def index
    render json: {
      message: params[:message],
      message1: params[:message],
      message2: params[:message],
      secret: Rails.application.secrets.some_other_secret,
      database: Rails.application.config.database_configuration['development']['some_other_config']
    }
  end

  def debug
    byebug
    render json: {}
  end
end
