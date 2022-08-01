class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      admin_homes_top_path
    when Customer
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when User
      admin_homes_top_path
    when Customer
      customers_my_page_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path
    else
      root_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
    [:name, :last_name,
    :first_name, :last_name_kana, :first_name_kana, :postal_code,
    :address, :telephone_number])
  end
end
