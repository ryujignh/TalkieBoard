require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  def test_index
    get items_path
    assert_response(:success)
  end

end
