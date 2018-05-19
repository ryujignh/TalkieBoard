class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category.update_attributes(category_params)
    if @category.errors.blank?
      redirect_to(root_path)
      flash[:success] = t('common.update_success', name: m(:category))
    else
      render_action(:edit)
      flash[:error] = @category.errors.full_messages
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :name_en, :image)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
