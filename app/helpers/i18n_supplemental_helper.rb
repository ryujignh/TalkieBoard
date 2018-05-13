module I18nSupplementalHelper
  class I18nSanitizer
    # need to get this into I18n somehow.
    # since I18n is a module, we can't attach the sanitize method and the rest of its required methods
    # to the host class when this is included in other classes, so we have to create a little wrapper class here.
    include ActionView::Helpers::SanitizeHelper
  end

  # utility method to get the translated field on an active record model
  def a(model_name, field_name, options = {})
    I18n.t(ar_key(model_name, field_name), options)
  end

  def as(model_name, field_name, options = {})
    I18n.ts(ar_key(model_name, field_name), options)
  end

  # utility method to get the translated error on an active record model
  def e(model_name, error_name, options = {})
    I18n.t(error_key(model_name, error_name), options)
  end

  # utility method to get the active record model name
  def m(model_name, options = {})
    I18n.t("activerecord.models.#{model_name}", options)
  end

  def ar_key(model_name, field_name)
    "activerecord.attributes.#{model_name}.#{field_name}"
  end

  def error_key(model_name, error_name)
    "activerecord.errors.models.#{model_name}.#{error_name}"
  end

  def ts(text, options = {})
    white_listed_tags = HTML::WhiteListSanitizer.allowed_tags.clone << 'b'
    white_listed_attributes = HTML::WhiteListSanitizer.allowed_attributes

    I18nSanitizer.new.sanitize(I18n.t(text, options), :tags => white_listed_tags, :attributes => white_listed_attributes)
  end

  def tsa(text, options = {})
    white_listed_tags = HTML::WhiteListSanitizer.allowed_tags.clone << 'a'
    white_listed_attributes = HTML::WhiteListSanitizer.allowed_attributes += ['target', 'base_url']

    I18nSanitizer.new.sanitize(I18n.t(text, options), :tags => white_listed_tags, :attributes => white_listed_attributes)
  end

end