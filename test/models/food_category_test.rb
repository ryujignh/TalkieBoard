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

end
