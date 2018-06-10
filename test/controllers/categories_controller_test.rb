require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = categories(:eat)
  end

  def test_show
    get category_path(@category.to_param)
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
    VCR.use_cassette("translate_eat") do
      assert_difference('Category.count', 1,
        "Should create item belongs to @category") do
        assert_call_google_translate_api
        post categories_path(create_params)
        assert_automatically_update_name_ja_with_translation(assigns[:category])
        assert_redirected_to(root_path)
      end
    end
  end

  def test_create_will_not_update_name_ja_if_included_in_params
    VCR.use_cassette("translate_eat") do
      assert_difference('Category.count', 1,
        "Should create item belongs to @category") do
        assert_call_google_translate_api
        params_with_name_ja = create_params
        params_with_name_ja[:category].merge!(name_ja: '食べるカテゴリー')
        post categories_path(params_with_name_ja)
        assert_equal('食べるカテゴリー',
        assigns[:category].name_ja,
        "Should keep the original value if explicitly included in params")
        assert_redirected_to(root_path)
      end
    end
  end

  def test_edit
    get edit_category_path(@category.to_param)
    assert_response(:success)
  end

  def test_update_success
    with_locale(:en) do
      put category_path(update_params.merge(id: @category.to_param))
      assert_redirected_to(root_path)
      assert_equal("Successfully updated Category.",
        flash[:success],
        "Should flash notice for update success")
      assert_update(@category.reload, update_params)
    end
  end

  private

  def create_params
    {
      category: {
        name: "Eat",
        name_ja: "",
        image: "",
      }
    }
  end

  def update_params
    {
      category: {
        name: "Name updated",
        name_ja: "Name ja updated",
        image: "image update path",
      },
    }
  end

  def assert_call_google_translate_api
    Translator.any_instance.expects(:translate).returns('食べる')
  end

  def assert_automatically_update_name_ja_with_translation(category)
    assert_equal('食べる',
      category.name_ja,
      "Should automatically update name_ja with Japanese translation fetched from Google translation API")

  end

end
