class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    end

    add_foreign_key :orders, :products
    add_foreign_key :orders, :clients
  end
end
