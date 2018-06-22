class FoodCategoryItemsController < ApplicationController

  before_action :set_category
  before_action :set_cuisine_types

  def index
    @items = @category.items
    set_meta_tags(title: @category.localized_name)

    if request.xhr?
      render(:json => {
        :html => render_to_string(:partial => 'food_category_items/food_items'),
      })
    end

  end

  private

  def set_category
    @category = FoodCategory.find_by_cuisine(params[:food_category_id])
  end

  def set_cuisine_types
    @cuisine_types = FoodCategory.cuisine_types
  end

end
