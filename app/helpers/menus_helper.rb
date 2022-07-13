module MenusHelper

  def render_dish_type(price_type)
    price_type == 'By Weight' ? 100 : 1
  end


  def render_with_checkboxes_by_categories (dishes)

  dishes.group_by{ |dish| dish[:category_id]}.each  do |key, val|
    @categories.find(key).category
        val.each do |dish|
        dish[:name]
        render_dish_type(dish[:price])   /  dish[:price]
        end
      end
    end
end