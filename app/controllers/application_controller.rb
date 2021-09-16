class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :gender_id, :birthday, :nickname,
                                             :sports_id, :active_area_id, :active_day_id, :active_time_id, :achievement_id, :achievement_content, :profile])
  end
end
