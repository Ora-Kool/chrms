class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LoginSessionsHelper
  include ManagerSessionsHelper
  before_action :set_locale

  def set_locale
  	if cookies[:chrms_locale] && I18n.available_locales.include?(cookies[:chrms_locale].to_sym)
  		l = cookies[:chrms_locale].to_sym
  	  else
  	  	l = I18n.default_locale
  	  	cookies.permanent[:chrms_locale] = l
  	end
  	I18n.locale = l
  end

end
