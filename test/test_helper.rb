ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def with_locale(locale_code)
    original_locale = I18n.locale
    begin
      I18n.locale = locale_code
      yield
    ensure
      I18n.locale = original_locale
    end
  end

  def assert_update(object, update_params)
    object_name = object.class.name.downcase.to_sym

    update_params[object_name].each_pair do |key, value|
      assert_equal(value,
        object[key],
        "Should update #{key} to #{value}")
    end
  end


end
