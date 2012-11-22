ActiveAdmin.register Product do
	scope :unavailable
	index do
		column "Product Name", :name
		column :category
		column :stock_no
		column :price, :sortable => :price do |product|	
			div :class => "price" do
				number_to_currency product.price
			end
		
		end
		column :image do |product|
			image_tag product.image, :width => '50%'
		end

		default_actions
	end

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs "Edit" do
			f.input :category
			f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
			f.input :name
			f.input :description
			f.input :price
			f.input :stock_no
			f.input :available
		end
		f.buttons
	end
end
