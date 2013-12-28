Deface::Override.new(:virtual_path => "spree/backend/products/_form",
                     :name => "add_location_to_admin_product_form",
                     :insert_top => '[data-hook="admin_product_form_right"]',
                     :partial => "spree/backend/products/location",
                     :disabled => false
					 )
