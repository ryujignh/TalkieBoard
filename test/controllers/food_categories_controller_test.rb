require 'test_helper'

class FoodCategoriesControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get food_categories_path

    assert_response(:success)
    assert_equal(@categories,
      assigns[:category],
      "Should define @category")
  end

end
