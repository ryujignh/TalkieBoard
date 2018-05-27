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

  def test_display_image
    item = items(:item_eat)
    assert_equal('shared/no_image.svg',
      item.display_image,
      "Should return default image path if item image doesn't exist"
      )

    item = items(:item_drink)
    item.update_attribute(:image, 'bathroom/toilet.svg')
    assert_equal('bathroom/toilet.svg',
      item.display_image,
      "Should return image path if specified image file exists"
      )
  end

end
