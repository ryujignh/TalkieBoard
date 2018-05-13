class SwitchLanguagesController < ApplicationController
  # allow setting language even if not logged in

  def update
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = cookies[:locale] = (params[:locale] || I18n.default_locale).to_s

    # now figure out where to return to:
    if request.env["HTTP_REFERER"]
      # go back to the page he was on, if there is a back object
      redirect_back(fallback_location: root_path)
    else
      redirect_to(root_path)
    end
  end

end