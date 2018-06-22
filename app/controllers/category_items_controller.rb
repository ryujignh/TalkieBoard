class CategoryItemsController < ApplicationController

  before_action :set_category
  before_action :set_item, only: [:edit, :update]

  def index
    @items = @category.items
    set_meta_tags(title: @category.localized_name)
  end

  def new
    @item = @category.items.new
  end

  def create
    @item = @category.items.new(category_items_params)
    update_translatable_fields(@item)
    if @item.save
      redirect_to category_items_path(@category)
    else
      render_action :new
      flash[:error] = "Error creating an item"
    end
  end

  def edit
    @item = @category.items.find(params[:id])
  end

  def update
    @item.update_attributes(category_items_params)

    if @item.errors.blank?
      redirect_to(category_items_path)
      flash[:success] = t('common.update_success', name: m(:item))
    else
      render_action(:new)
      flash[:error] = @category.errors.full_messages
    end
  end

  private

  def update_translatable_fields(item)
    translator = Translator.new
    Item::TRANSLATABLE_FIELDS[:ja].each_pair do |source, target|
      next if skip_if_translation_present(item, target)
      translation = translator.translate(@item.send(source))
      @item.update_attribute(target, translation)
    end
  end

  def skip_if_translation_present(item, target)
    !item.send(target).blank?
  end

  def set_category
    @category = Category.find_by_identifier(params[:category_id].downcase)
  end

  def set_item
    @item = @category.items.find(params[:id])
  end

  def category_items_params
    params.require(:item).permit(:name, :name_ja, :description, :description_ja, :image)
  end

end
