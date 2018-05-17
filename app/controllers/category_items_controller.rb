class CategoryItemsController < ApplicationController

  before_action :set_category

  def index
    @items = @category.items
  end

  def new
    @item = @category.items.new
  end

  def create
    @item = @category.items.new(category_items_params)
    if @item.save
      redirect_to category_items_path(@category)
    else
      render_action :new
      flash[:error] = "Error creating an item"
    end
  end

  def set_category
    @category = Category.find(params[:category_id])

  end

  private

  def category_items_params
    params.require(:item).permit(:name, :name_en, :description, :description_en, :image)
  end

end
