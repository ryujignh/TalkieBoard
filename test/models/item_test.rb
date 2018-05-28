require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  def test_associaiton
    new_item = Item.new(name: 'New category')
    assert_false(new_item.valid?,
      "Should be invalid if category doesn't exist")

    new_item = Item.new(category: categories(:eat), name: 'New category')
    assert(new_item.valid?,
      "Should be valid if category present")
  end

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

  def test_validate_position_in_a_same_category
    item = items(:item_eat)
    assert(item.position == 1,
      "Should have position 1")

    new_item = Item.new(category: categories(:eat), name: 'New category', position: 1)
    assert_false(new_item.valid?,
      "Should be invalid if position duplicates with other")

    new_item = Item.new(category: categories(:eat), name: 'New category', position: 5)
    assert(new_item.valid?,
      "Should be valid if position is unique")
  end

  def test_validate_position_across_different_categories
    item = items(:item_eat)
    assert(item.position == 1,
      "Should have position 1")

    new_item = Item.new(category: categories(:eat), name: 'New category', position: 1)
    assert_false(new_item.valid?,
      "Should be invalid if position duplicates is a same category")

    new_item = Item.new(category: categories(:drink), name: 'New category', position: 1)
    assert(new_item.valid?,
      "Should be valid if position is unique in different category")
  end

end
