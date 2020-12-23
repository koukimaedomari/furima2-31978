class CreateOrderCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :order_cashes do |t|

      t.timestamps
    end
  end
end
