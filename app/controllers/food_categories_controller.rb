class FoodCategoriesController < ApplicationController

  def index
    @categories = FoodCategory.with_cuisine.includes(:items)
    set_meta_tags(title: m(:food_category))
  end

end
