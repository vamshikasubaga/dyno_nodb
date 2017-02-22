class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def standard_error_message(error)
    logger.error error.message
    render json: error.to_json, status: 500
  end
end
