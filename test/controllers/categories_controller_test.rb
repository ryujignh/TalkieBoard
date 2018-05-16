require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def test_show
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

  def test_new
    get new_category_path
    assert_response(:success)
    assert(assigns[:category],
      "Should define new category object")
  end

  def test_create
    post categories_path(create_params)
    assert_redirected_to(root_path)
  end

  private

  def create_params
    {
      category: {
        name: "新カテゴリ",
        name_en: "New category",
        image: "",
      }
    }
  end

end
