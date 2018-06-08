require 'test_helper'

class FoodItemTest < ActiveSupport::TestCase

  def test_association
    food_item = food_items(:curry)

    assert_equal(food_categories(:japanese),
      food_item.category,
      "Should belongs to food categories :japanese")
  end

end
