Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_latitude_and_longitude",
                     :insert_before => "[data-hook='admin_product_form_right']",
                     :partial => "spree/admin/products/location",  
                     :disabled => false                   				                                  
					 )            
					 
Deface::Override.new(:virtual_path => "spree/admin/products/edit",
                     :name => "add_location",
                     :insert_before => "[class='no-border-top']",
                     :text => "<% @product.location ||= Spree::Location.new %>",  
                     :disabled => false                   				                                  
					 )            
