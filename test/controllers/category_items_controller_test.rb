require 'test_helper'

class CategoryItemsControllerTest < ActionDispatch::IntegrationTest

  def test_index
    category = categories(:eat)
    get category_items_path(category)

    assert_response(:success)

    assert_equal(category,
      assigns[:category],
      "Should define @category")

    assert(assigns[:items].first == items(:item_eat),
      "Should define @items belongs to #{category}")
  end

end
