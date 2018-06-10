require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase

  def test_association
    food_item = food_items(:curry)

    assert_equal(food_categories(:japanese),
      food_item.category,
      "Should belongs to food categories :japanese")
  end

  def test_scope_cuisine
    assert_equal(2,
      FoodItem.cuisine('japanese').size,
      "Should have 2 japaense food items")

    japanese_foods = [
      food_items(:curry),
      food_items(:ramen),
    ]

    assert_equal(japanese_foods.sort,
      FoodItem.cuisine('japanese').sort,
      "Should return Japanese food items")
  end

  def test_format_cuisine
    item = FoodItem.create!(cuisine: "Japanese")
    assert_equal('japanese',
      item.cuisine,
      "Should conver cuisine to downcase before save")
  end

  def test_format_cuisine
    category = food_categories(:japanese)
    assert_equal('ja',
      category.cuisine,
      "Should be ja")

    item = category.items.create!
    assert_equal('ja',
      item.cuisine,
      "Should inherit parent cuisine type")
  end

end
