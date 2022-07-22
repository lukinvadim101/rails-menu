class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def new
    # @categories = Category.all
    @dishes = Dish.all
    @menu = Menu.new
  end

  def index
    @menus = Menu.all
    @dishes = Dish.all
    @categories = Category.all
  end

  def edit; end

  def destroy
    @menu.destroy
    redirect_to root_path, notice: 'menu was deleted'
  end

  def update
    @menu.update(menu_params)
    redirect_to menus_path(@menu), notice: 'menu was updated'
  end

  def create
    @menu = Menu.create(menu_params)
    @dishes = Dish.all

    #
    # Post.create(content: params[:post][:content], category: category)
    redirect_to root_path, notice: 'Menu was created' if @menu.save
  end

  def show; end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    # dish = DishMenu.find_or_create_by(price: params[:menu][:dish_menus_attributes][:price])
    params.require(:menu).permit(:date, dish_ids: [], dish_menus: [:price])
  end
end
