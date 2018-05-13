class LocaleController < ApplicationController
  # allow setting language even if not logged in
  # skip_before_filter  :authenticate_user!, :set_company

  def show
    locale = cookies[:locale] = (params[:id] || I18n.default_locale).to_s

    # user has toggled the language so update his record's language attribute
    # current_user.set_language(locale) if current_user

    if params[:reload]
      LocaleParser.reload_translations
    end

    # now figure out where to return to:
    if request.env["HTTP_REFERER"]
      # go back to the page he was on, if there is a back object
      redirect_back(fallback_location: root_path)
    else
      redirect_to(root_path)
    end
  end

end