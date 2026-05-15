class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  
  before_action :authenticate_user!, unless: :skip_authentication?

  def after_sign_in_path_for(resource)
    decks_path
  end

  def after_sign_up_path_for(resource)
    decks_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def skip_authentication?
    devise_controller? || (controller_name == 'pages' && action_name == 'home')
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end