module ApplicationHelper
	def round_in_customers_favour amount
        (amount * 100).to_i / 100.0
	end

	def tax_percent amount
	  sprintf("%.2f", amount * 100) + "%"
	end
		
end
