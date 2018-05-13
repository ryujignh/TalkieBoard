require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def test_index
    category = categories(:eat)
    get category_path(category)
    assert_response(:success)
    assert_equal(category,
      assigns[:category],
      "Should define @category")

    assert(!assigns[:items].nil?,
      "Should define @items belongs to #{category}")
    assert(assigns[:items].first == items(:item_eat),
      "Should define @items belongs to #{category}")
  end

end
