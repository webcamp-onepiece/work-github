class ApplicationController < ActionController::Base
  # devise_controller実行前にconfigure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Admin
      admin_top_path
    end
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # sign_up時に保存するカラムの追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
  end
end
