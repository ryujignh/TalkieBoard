class HomeController < ApplicationController

  def index
    @categories = Category.all.order('position ASC')
    @food_category = FoodCategory.first
    set_meta_tags(title: t('category.want_to'))
  end

end
