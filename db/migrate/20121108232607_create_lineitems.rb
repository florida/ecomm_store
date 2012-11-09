class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.references :product
      t.references :order
      t.integer :quantity
      t.float :unit_price

      t.timestamps
    end
  end
end
