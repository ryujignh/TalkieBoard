class FoodCategoriesController < ApplicationController

  def index
    @categories = FoodCategory.all.includes(:items)
  end

end
