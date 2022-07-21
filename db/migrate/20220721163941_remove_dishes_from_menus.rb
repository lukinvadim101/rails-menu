class RemoveDishesFromMenus < ActiveRecord::Migration[6.0]
  def change
    remove_column :menus, :dishes, :string
  end
end
