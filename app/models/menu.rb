class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus

  def initialized_dishes
    [].tap do |o|
      Dish.all.each do |dish|
        if DishMenu.find { |c| c.dish_id == dish.id }
        else
          o << DishMenu.new(price: dish.price)
        end
      end
    end
  end
end
