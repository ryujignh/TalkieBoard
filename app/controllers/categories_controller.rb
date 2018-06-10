class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def show
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    translator = Translator.new
    name_ja = translator.translate(@category.name)

    update_name_ja_with_translation(@category, name_ja)

    if @category.save
      redirect_to(root_path)
    else
      render_action(:new)
      flash[:error] = @category.errors.full_messages
    end
  end

  def edit
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

  def update_name_ja_with_translation(category, name_ja)
    return unless category.name_ja.blank?

    category.name_ja = name_ja
  end

  def category_params
    params.require(:category).permit(:name, :name_ja, :image)
  end

  def set_category
    @category = Category.find_by_name(params[:id])
  end

end
