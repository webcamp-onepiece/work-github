class ApplicationController < ActionController::Base
  # devise_controller実行前にconfigure_permitted_parametersを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
    def after_sign_up_path_for(resource_or_scope)
           customers_my_page_path
    
    end


  #ログイン後の遷移先
  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when Customer
      root_path
    when Admin
      admin_top_path
    end
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    case resource_or_scope
    when :customer
      root_path
    when :admin
      new_admin_session_path
    end
  end

  protected

  # sign_up時に保存するカラムの追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :is_deleted])
  end
end
