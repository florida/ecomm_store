ActiveAdmin.register Order do
	show do
	  panel "Lineitems" do
	    table_for order.lineitems do
	      column "name" do |item|
	        item.product.name
	      end
	      column :product_id
	      column :quantity
	      column :unit_price
	    end
	  end
	end
end