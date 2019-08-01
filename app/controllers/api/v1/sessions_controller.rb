# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
          user_json = UserSerializer.new(user).serialized_json
          render json: user_json
        else
          render json: { error: 'Email or password invalid.' },
                 status: :unprocessable_entity
        end
      end
    end
  end
end
