class CreateOrders < ActiveRecord::Migration[5.1]
  def change
=begin    create_join_table :clients, :products, table_name: :orders, id: true do |t|
      #t.primary_key :id
      t.index :product_id
      t.index :client_id
    end
=end

    create_table :orders do |t|
      t.references  :product, foreign_key: true, null: false, on_delete: :cascade
      t.references  :client, foreign_key: true, null: false, on_delete: :cascade
    end

  end
end
