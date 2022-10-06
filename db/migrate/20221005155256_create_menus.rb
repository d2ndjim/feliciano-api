class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :category
      t.decimal :price
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
