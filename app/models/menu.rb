class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus


  validates_presence_of :dish_menus, message: 'Can not be blank!'
  validates_uniqueness_of :date, message: 'Same Date!'


  accepts_nested_attributes_for :dish_menus,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['included'] == '0' }
end
