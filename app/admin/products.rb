ActiveAdmin.register Product do
	index do
		column "Product Name", :name
		column :category
		column :stock_no
		column :price, :sortable => :price do |product|	
			div :class => "price" do
				number_to_currency product.price
			end
			
		end
		default_actions
	end
end
