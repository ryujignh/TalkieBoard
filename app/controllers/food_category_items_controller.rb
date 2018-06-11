class FoodCategoryItemsController < ApplicationController

  before_action :set_category

  def index
    @items = @category.items
    set_meta_tags(title: @category.localized_name)
  end

  private

  def set_category
    @category = FoodCategory.find_by_cuisine(params[:food_category_id])
  end

end
