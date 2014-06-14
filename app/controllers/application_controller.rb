class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # http_basic_authenticate_with :name => "jam", :password => "on toast!"

  before_filter :configure_devise_params, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  rescue_from Workflow::NoTransitionAllowed do |exception|
    redirect_to :back, alert: "Sorry, you can't do that"
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, alert: "Sorry, that page was not found"
  end

  def after_sign_in_path_for(resource)
    me_path
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
  end

end
