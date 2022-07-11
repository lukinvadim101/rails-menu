module MenusHelper

  def render_dish_type(price_type)
    price_type == 'By Weight' ? 1 : 100
  end

end