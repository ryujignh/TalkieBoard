require 'test_helper'

class FoodCategoryTest < ActiveSupport::TestCase

  def test_association
    food = food_categories(:japanese)
    assert_equal(2,
      food.items.size,
      "Should have 2 food items belong to japanese food category")

    assert_equal([food_items(:curry), food_items(:ramen)],
      food.items,
      "Should have 2 food items belong to japanese food category")

  end

  def test_association
    assert_equal(5,
      FoodCategory.with_cuisine.size,
      "Should have 5 food categories with specific cuisine type")


    categories = [
      food_categories(:japanese),
      food_categories(:italian),
      food_categories(:french),
      food_categories(:american),
      food_categories(:chinese),
    ]

    assert_equal(categories.sort,
      FoodCategory.with_cuisine.sort,
      "Should return #{categories}")

  end

  def test_cuisine_types
    I18n.locale = :ja
    assert_equal([
      ["ja", "和食"],
      ["us", "アメリカン"],
      ["it", "イタリアン"],
      ["fr", "フレンチ"],
      ["ch", "中華"]
    ],
      FoodCategory.cuisine_types,
      "Should array of cuisine + localized name")
  end

end
