class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus

  # accepts_nested_attributes_for :dish_menus

  def dish_menus_attributes=(dish_menus_attributes)
    dish_menus_attributes.each_value do |dish_menus_attribute|
      dish_menu = DishMenu.find_or_create_by(dish_menus_attribute)
      dish_menus << dish_menu
    end
  end
end
