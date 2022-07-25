class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]

  def new
    @menu = Menu.new
    @dish_menu = @menu.dish_menus.build
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
    redirect_to root_path, notice: 'menu was updated'
  end

  def create
    @menu = Menu.create(menu_params)
    redirect_to root_path, notice: 'Menu was created' if @menu.save
  end

  def show; end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:date, :id, dish_menus_attributes: %i[id dish_id price menu_id included])
  end
end
