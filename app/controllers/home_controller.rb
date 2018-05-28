class HomeController < ApplicationController

  def index
    @categories = Category.all.order('position ASC')
  end

end
