class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def new
    @categories = Category.all
    @menu = Menu.new
    @dishMenu = DishMenu.all
  end

  def index
    @menus = Menu.all
    @dishes = Dish.all
    @categories = Category.all
  end

  def edit
  end

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

    if @menu.save
      redirect_to root_path, notice: 'Menu was created'
    end
  end

  def show
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:date, dish_ids:[])
  end
end
