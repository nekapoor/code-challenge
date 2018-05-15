module Api
	class ApiController < ApplicationController
    # before_action :authenticate_token!

    private

    def required_api_token
      ENV["TOKEN"]
    end

    def authenticate_token!
      unless params[:token] === required_api_token
        render json: { error: :unauthorized }, status: :unauthorized
      end
    end


	end
end