class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :gender_id, :birthday, :image, :nickname,
                                             :sports_id, :active_area_id, :active_day_id, :active_time_id, :achievement_id, :achievement_content, :profile])
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :nickname, :sports_id, :active_area_id, :active_day_id, :active_time_id, :achievement_id, :achievement_content, :profile])
  end
end
