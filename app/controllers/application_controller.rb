class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller? #user新規作成の項目追加
  before_action :configure_account_update_parameters, if: :devise_controller? #編集項目の追加
  
  private
  #user新規作成用
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :name, :ruby, :tel, :postcode, :prefecture_name, :prefecture_code, :address_city, :address_street, :address_building, :icon, :introduction])
  end
  #user編集用
  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:[:email, :name, :ruby, :tel, :postcode, :prefecture_name, :prefecture_code, :address_city, :address_street, :address_building, :icon, :introduction])
  end
end
