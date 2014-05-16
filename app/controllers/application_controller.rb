class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with :name => "jam", :password => "on toast!"

  def after_sign_in_path_for(resource)
    me_path
  end

end
