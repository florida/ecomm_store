module StoreHelper
	def span_label label
		content_tag(:span, :class => 'label') do 
			label
		end
	end 

	def span_value value
		content_tag(:span, :class => 'value') do
			"#{value}"
		end 
	end 


end
