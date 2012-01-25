class ApplicationController < ActionController::Base
	include UrlHelper
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to admin_dashboard_url, :alert => exception.message
  end
end
