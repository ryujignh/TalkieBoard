module ApplicationHelper

  def avilable_language
    I18n.locale == :ja ? :en : :ja
  end

  def avilable_language_in_words
    I18n.locale == :ja ? t('common.languages.english') : t('common.languages.japanese')
  end

  def set_locale
    cookies[:locale] = (params[:id] || I18n.default_locale).to_s
  end

end
