class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.reference :product_id
      t.reference :order_id
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
