require 'test_helper'

class CategoryItemsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:eat)
    @item = @category.items.first
  end

  def test_index
    get category_items_path(@category.to_param)

    assert_response(:success)
    assert_equal(@category,
      assigns[:category],
      "Should define @category")

    assert(assigns[:items].first == items(:item_eat),
      "Should define @items belongs to #{@category}")
  end

  def test_new
    get new_category_item_path(@category.to_param)

    assert_response(:success)
    assert(assigns[:item],
      "Should instantiate new Item object")
  end

  def test_create
    VCR.use_cassette("item_response", record: :new_episodes) do
      assert_difference('@category.items.count', 1,
        "Should create item belongs to @category") do
        post category_items_path(@category, create_params)

        assert_equal('林檎',
          assigns[:item].name_ja,
          "Should save name_ja with translation")

        assert_equal('私はリンゴを食べたい。',
          assigns[:item].description_ja,
          "Should save description_ja with translation")

        assert_redirected_to(category_items_path(@category.to_param))
      end
    end
  end

  def test_create_will_not_call_google_translate_api_if_ja_fields_present
    VCR.use_cassette("item_response", record: :new_episodes) do
      assert_difference('@category.items.count', 1,
        "Should create item belongs to @category") do
        with_ja_params = create_params
        with_ja_params[:item].merge!(name_ja: 'りんごちゃん', description_ja: 'りんごちゃんが食べたい。')
        post category_items_path(@category, with_ja_params)

        assert_equal('りんごちゃん',
          assigns[:item].name_ja,
          "Should keep the origianl name_ja")

        assert_equal('りんごちゃんが食べたい。',
          assigns[:item].description_ja,
          "Should keep the origianl name_ja")

        assert_redirected_to(category_items_path(@category.to_param))
      end
    end
  end

  def test_edit
    get edit_category_item_path(@category.to_param, @item)
    assert_response(:success)
  end

  def test_update
    with_locale(:en) do
      item = @item
      put category_item_path(update_params.merge(id: item.id, category_id: @category.to_param))
      assert_redirected_to(category_items_path(@category.to_param))
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
        name: "Apple",
        name_ja: "",
        description: "I want to eat an apple.",
        description_ja: "",
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
        image: "updated_image",
      },
    }
  end

end
