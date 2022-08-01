class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postal_code
      t.string :adress
      t.string :name
      t.integer :shopping_cost
      t.integer :total_price
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0
      t.timestamps
    end
  end
end
