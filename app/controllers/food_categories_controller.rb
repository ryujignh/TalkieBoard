class FoodCategoriesController < ApplicationController

  def index
    @categories = FoodCategory.with_cuisine.includes(:items)
  end

end
