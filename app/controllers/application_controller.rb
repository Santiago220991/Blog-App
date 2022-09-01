class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include ExceptionHandler
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?

  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: "JWT_ error: #{e.message}" }, status: :unauthorized
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :posts_counter, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
