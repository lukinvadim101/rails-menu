class DishesController < ApplicationController
  before_action :set_dish, only: %i[update show destroy edit]

  def create
    @dish = Dish.create(dish_params)
    redirect_to dishes_path, notice: 'dish was created' if @dish.save
  end

  def update
    @dish.update(dish_params)
    redirect_to dish_path(@dish), notice: 'dish was updated'
  end

  def destroy
    @menus = Menu.all

    if @menus.map { |m| m.dishes.include? @dish[:id].to_s }.first == true
      redirect_to dishes_path, notice: 'Error! Dish is included in menu'
    else
      @dish.destroy
      redirect_to dishes_path, notice: 'Dish was destroyed'
    end
  end

  def show
    @category = Category.find(Dish.find(params[:id]).category_id)
  end

  def index
    @menus = Menu.all
    @categories = Category.all
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def edit; end

  private

  def dish_params
    params.require(:dish).permit(:name, :price_type, :price, :category_id)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
