class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def new
    @menu = Menu.new
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
    redirect_to menus_path, notice: 'menu was deleted'
  end

  def update
    @menu.update(menu_params)

    redirect_to menus_path(@menu), notice: 'menu was updated'
  end


  def create
    @menu = Menu.create(menu_params)
    @dishes = Dish.all

    if @menu.save
      redirect_to new_menu_path, notice: 'Menu was created'
    end
  end

  def show
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:date, dishes:[])
  end
end
