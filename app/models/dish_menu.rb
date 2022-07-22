class DishMenu < ApplicationRecord
  belongs_to :dish
  belongs_to :menu

  accepts_nested_attributes_for :dish
end
