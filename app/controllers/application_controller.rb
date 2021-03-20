class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: :new

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :chinese_character_last_name, :chinese_character_first_name, :kana_last_name, :kana_first_name, :birthday])
  end
end
