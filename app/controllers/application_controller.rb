# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  
  def authenticate
    # HTTP authentication by token
    # key: Authorization
    # value: Token token=[user token]
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by_token(token)
    end
  end
end
