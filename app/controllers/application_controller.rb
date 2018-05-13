class ApplicationController < ActionController::Base
  include I18nSupplementalHelper
  include ApplicationHelper
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = (cookies[:locale] || I18n.default_locale).to_s
  end

end
