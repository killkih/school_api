class ApplicationController < ActionController::API

  def bearer_token
    request.headers['Authorization']&.split(' ')&.last
  end
end
