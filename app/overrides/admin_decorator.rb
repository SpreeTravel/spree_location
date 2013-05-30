Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_latitude_and_longitude",
                     :insert_before => "[data-hook='admin_product_form_right']",
                     :partial => "spree/admin/products/location",                     				                                  
					 )            
					 
