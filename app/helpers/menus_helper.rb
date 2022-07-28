module MenusHelper

  def render_dish_type(price_type)
    price_type == 'By Weight' ? 100 : 1
  end

  def render_with_checkboxes_by_categories (dishes)
    dishes.group_by{ |dish| dish[:category_id] }.each do |key, val|
      @categories.find(key).category
      val.each do |dish|
        dish[:name]
        render_dish_type(dish[:price]) / dish[:price]
      end
    end
  end

  def dish_included_in_menu?(menu_id, dish_id)
    el = DishMenu.where(menu_id: menu_id, dish_id: dish_id).first
    el.nil? ? false : el.included
  end

  def dish_price_in_menu(menu_id, dish_id)
    el = DishMenu.where(menu_id: menu_id, dish_id: dish_id)
    el.first.nil? ? Dish.find(dish_id).price : el.min_by { |dish_menu| dish_menu[:date] }.price
  end
end
