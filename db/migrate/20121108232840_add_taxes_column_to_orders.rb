class AddTaxesColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :hst, :float
    add_column :orders, :gst, :float
    add_column :orders, :pst, :float
  end
end
