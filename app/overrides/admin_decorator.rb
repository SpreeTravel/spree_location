Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_latitude_and_longitude",
                     :insert_after => "[data-hook='admin_product_form_right']",
                     :text => " 
						<%= f.label :latitude, I18n.t('latitude') %> <br />
						<%= f.number_field  I18n.t(latitude) %> 
						<%= f.label :longitude, I18n.t('longitude') %> <br />
						<%= f.number_field  I18n.t(longitude) %>                      
                     ")
                                          
