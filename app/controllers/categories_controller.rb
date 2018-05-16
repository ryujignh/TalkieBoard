class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to(root_path)
    else
      render_action(:new)
      flash[:error] = @category.errors.full_messages
    end
  end

  def category_params
    params.require(:category).permit(:name, :name_en, :image)
  end

end
