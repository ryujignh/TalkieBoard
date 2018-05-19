require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:eat)
  end

  def test_show
    get category_path(@category)
    assert_response(:success)
    assert_equal(@category,
      assigns[:category],
      "Should define @category")

    assert(!assigns[:items].nil?,
      "Should define @items belongs to #{@category}")
    assert(assigns[:items].first == items(:item_eat),
      "Should define @items belongs to #{@category}")
  end

  def test_new
    get new_category_path
    assert_response(:success)
    assert(assigns[:category],
      "Should define new category object")
  end

  def test_create_success
    assert_difference('Category.count', 1,
      "Should create item belongs to @category") do
      post categories_path(create_params)
      assert_redirected_to(root_path)
    end
  end

  def test_edit
    get edit_category_path(@category)
    assert_response(:success)
  end

  def test_update_success
    with_locale(:en) do
      put category_path(update_params)
      assert_redirected_to(root_path)
      assert_equal("Successfully updated Category.",
        flash[:success],
        "Should flash notice for update success")
    end
  end

  private

  def update_params
    {
      id: @category.id,
      category: {
        name: "Name updated",
        name_en: "Name en updated",
        image: "image update path",
      },
    }
  end

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
