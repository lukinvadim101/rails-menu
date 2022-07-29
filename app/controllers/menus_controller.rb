class MenusController < ApplicationController
  before_action :set_menu, only: %i[show edit update destroy]
  before_action :set_dishes, only: %i[edit new index destroy]

  def new
    @menu = Menu.new
    @dishes.count.times { @menu.dish_menus.build }
  end

  def index
    @menus = Menu.all
    @categories = Category.all
  end

  def edit
    redirect_to new_menu_path, alert: 'Must be unique' unless @menu.save

  end

  def destroy
    @menu.destroy
    redirect_to root_path, notice: 'menu was deleted'
  end

  def update
    @menu.update(menu_params)
    redirect_to root_path, notice: 'menu was updated' if @menu.save
  end

  def create
    # binding.pry
    @menu = Menu.create(menu_params)
    redirect_to new_menu_path, alert: 'Must be unique' unless @menu.save
    redirect_to root_path, notice: 'Menu was created' if @menu.save
  end

  def show; end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_dishes
    @dishes = Dish.all
  end

  def menu_params
    params.require(:menu).permit(:date, :id, dish_menus_attributes: %i[dish_id price menu_id included id _destroy])
  end
end
