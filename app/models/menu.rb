class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus

  accepts_nested_attributes_for :dish_menus
  accepts_nested_attributes_for :dishes

  # def dish_ids(ids)
  #   ids.each do |atr|
  #     d = DishMenu.find_or_create_by(atr)
  #     dishes << d
  #   end
  # end
end
