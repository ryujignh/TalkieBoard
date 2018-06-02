require 'test_helper'

class CategoryItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:eat)
    @item = @category.items.first
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

  def test_edit
    get edit_category_item_path(@category, @item)
    assert_response(:success)
  end

  def test_update
    with_locale(:en) do
      item = @item
      put category_item_path(update_params.merge(id: item.id, category_id: @category.id))
      assert_redirected_to(category_items_path(@category))
      assert_equal("Successfully updated Item.",
        flash[:success],
        "Should flash notice for update success")

      assert_update(item.reload, update_params)
    end
  end

  private

  def create_params
    {
      item: {
        name: "name",
        name_ja: "name_ja",
        description: "description",
        description_ja: "description_ja",
        image: "image",
      }
    }
  end

  def update_params
    {
      item: {
        name: "Updated name",
        name_ja: "Updated name_ja",
        description: "Updated description",
        description_ja: "Updated description_ja",
        image: "Updated image",
      },
    }
  end

end
