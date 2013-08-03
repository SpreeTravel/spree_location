Spree::ProductsHelper.module_eval do

	def setup_location(product)
	    product.location ||= Spree::Location.new
	    product
	end
end
