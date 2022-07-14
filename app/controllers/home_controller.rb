class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[login]

  def index
    @menus = Menu.all
    @dishes = Dish.all
    @categories = Category.all
  end

  def login
  end
end
