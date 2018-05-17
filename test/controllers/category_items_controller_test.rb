require 'test_helper'

class CategoryItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:eat)
  end

  def test_index
    get category_items_path(@category)

    assert_response(:success)
    assert_equal(@category,
      assigns[:category],
      "Should define @category")

    assert(assigns[:items].first == items(:item_eat),
      "Should define @items belongs to #{@category}")
  end

  def test_new
    get new_category_item_path(@category)

    assert_response(:success)
    assert(assigns[:item],
      "Should instantiate new Item object")
  end

  def test_create
    assert_difference('@category.items.count', 1,
      "Should create item belongs to @category") do
      post category_items_path(@category, create_params)
      assert_redirected_to(category_items_path(@category))
    end
  end

  private

  def create_params
    {
      item: {
        name: "name",
        name_en: "name_en",
        description: "description",
        description_en: "description_en",
        image: "image",
      }
    }
  end

end
