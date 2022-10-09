class AddOrderDateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_date, :date
  end
end
