module MenusHelper
  def dish_price_type(dish_id)
    type = @dishes.find(dish_id).price_type
    type.include?('By Weight') ? type.to_i : 1
  end

  def dish_included_in_menu?(menu_id, dish_id)
    el = DishMenu.where(menu_id: menu_id, dish_id: dish_id).first
    el.nil? ? false : el.included
  end

  def dish_price_in_menu(menu_id, dish_id)
    el = DishMenu.where(menu_id: menu_id, dish_id: dish_id)
    el.first.nil? ? Dish.find(dish_id).price : el.min_by { |dish_menu| dish_menu[:date] }.price
  end

  def find_last_dish_price(dish_id)
    dish_in_menu = DishMenu.where(dish_id: dish_id)

    dish_in_menu.exists? ? dish_in_menu.to_a { |e| e[:date] }.last[:price] : Dish.find(dish_id).price
  end
end
