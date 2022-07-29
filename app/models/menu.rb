class Menu < ApplicationRecord
  has_many :dish_menus
  has_many :dishes, through: :dish_menus
  before_save :call_before_save


  validates_presence_of :dish_menus, message: 'Can not be blank!'

  accepts_nested_attributes_for :dish_menus,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['included'] == '0' }

  def call_before_save
    puts self
  end
end
