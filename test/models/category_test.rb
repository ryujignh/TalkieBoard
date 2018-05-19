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
      "Should return English name if locale is English"
    )
  end

  def test_display_image
    category = categories(:eat)
    assert_equal('shared/no_image.png',
      category.display_image,
      "Should return default image path if category image doesn't exist"
      )

    category = categories(:bathroom)
    category.update_attribute(:image, 'bathroom/toilet.png')
    assert_equal('bathroom/toilet.png',
      category.display_image,
      "Should return image path if specified image file exists"
      )
  end

end
