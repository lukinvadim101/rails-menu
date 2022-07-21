class Dish < ApplicationRecord
  belongs_to :category
  has_many :dish_menus
  has_many :menus, through: :dish_menus
end
