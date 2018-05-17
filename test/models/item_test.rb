require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def test_localize_name
    item = items(:item_eat)
    I18n.locale = :ja

    assert_equal(item.name,
      item.localized_name,
      "Should return Japanese name if locale is Japanese"
    )

    I18n.locale = :en

    assert_equal(item.name_en,
      item.localized_name,
      "Should return English name if locale is English"
    )

  end

end
