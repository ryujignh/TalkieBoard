class ApplicationController < ActionController::Base
  include I18nSupplementalHelper
  protect_from_forgery with: :exception
end
