# -*- coding: utf-8 -*-
# adding extra I18n methods here

module I18n
  include I18nSupplementalHelper

  def english?
    I18n.locale.to_s == 'en'
  end

  def japanese?
    I18n.locale.to_s == 'ja'
  end

  def locale_id
    Language.id_for_code(I18n.locale.to_s)
  end

  # these methods are already included in ActiveRecord::Base, our test_helper, and the mailer,
  # so we can use these without the I18n namespacing.
  #
  # for the times we are using translations in a class other than the above, we need to have a namespace
  # to call these functions, and it is the easiest to remember as methods on I18n.
  # however, we need to add these as module functions because I18n is defined in Rails as a module and
  # we want the usability of a simple class method.
  module_function :a, :as, :e, :m, :ar_key, :ts, :error_key, :english?, :japanese?, :locale_id

end
