Deface::Override.new(:virtual_path => "spree/backend/app/views/spree/admin/_form",
                     :name => "add_latitude_and_longitude",
                     :insert_bottom => "[data-hook='admin_product_form_right']",
                     :text => "<%= f.label :latitude, I18n.t('latitude') %> <br />
                               <%= f.number_field  I18n.t(latitude) %> ",
                     :disabled => false)
