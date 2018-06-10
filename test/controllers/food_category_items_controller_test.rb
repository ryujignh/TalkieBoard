require 'test_helper'

class FoodCategoryItemsControllerTest < ActionDispatch::IntegrationTest
  def test_index
    category = food_categories(:japanese)
    get food_category_items_path(category)
    assert_response :success
    assert(assigns[:items],
      "Should define @items variable")
  end

end
