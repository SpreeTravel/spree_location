Spree::Admin::ProductsController.class_eval do
 
# before_filter :load_data, :except => :index
  
 
  protected	
	def load_location
	  @product = Product.new
      3.times { @product.location.build}	  
	end    
end
