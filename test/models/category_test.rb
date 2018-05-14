require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def test_localize_name
    category = categories(:eat)
    I18n.locale = :ja

    assert_equal(category.name,
      category.localized_name,
      "Should return Japanese name if locale is Japanese"
    )

    I18n.locale = :en

    assert_equal(category.name_en,
      category.localized_name,
      "Should return English name if locale is Japanese"
    )

  end

end
