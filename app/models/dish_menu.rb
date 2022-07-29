class DishMenu < ApplicationRecord
  belongs_to :dish
  belongs_to :menu

  accepts_nested_attributes_for :dish
  validates_uniqueness_of :dish_id, scope: %i[menu_id]

end
