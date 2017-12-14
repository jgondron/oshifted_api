class EchoController < ApplicationController
  def index
    render json: {
      message: params[:message],
      secrets: Rails.application.secrets,
      database: Rails.application.config.database_configuration['development']['some_other_config']
    }
  end

  def debug
    byebug
    render json: {}
  end
end
