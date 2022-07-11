class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.all
    end

    def show
    end

    def new
      @category = Category.new
    end

    def edit
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to dishes_path, notice: "Category was successfully created."
      end

    end

    def update
      @category.update(category_params)

      redirect_to categories_path(@category), notice: 'Category was updated'
    end

    def destroy

      if Dish.find_by(category_id: @category[:id]).nil?
        @category.destroy
        redirect_to categories_path, notice: "Category was destroyed."
      else
        redirect_to categories_path, notice: "Category can't be destroyed."
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:category)
    end
end

