class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus
  before_save :call_before_save

  accepts_nested_attributes_for :dish_menus, reject_if: proc { |attributes| attributes['included'] == '0' }

  def call_before_save
    puts dish_menus.inspect
  end
end