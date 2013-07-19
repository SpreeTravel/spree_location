Spree::ProductsHelper.module_eval do
    def product_map(product)		
        variant = 2		                
        full_url = ''

		product.location ||= Spree::Location.new({latitude: 40.689060, longitude: -74.044636})
				
		latitude = product.location.latitude
		longitude = product.location.longitude
		        
        case variant
        when 0
            full_url = '/assets/staticmap.png'
        when 1
            url = "http://maps.google.com/maps/api/staticmap"
            options = {}
            options[:size] = '340x255'
            options[:maptype] = 'roadmap'
            options[:sensor] = 'false'            
            options[:markers] = "#{latitude},#{longitude},blue"
            options[:center] = "#{latitude},#{longitude}"
            options[:zoom] = 15
            query_string = options.keys.collect{|key| "#{key}=#{options[key]}"}.join('&')            
            full_url = "#{url}?#{query_string}"
        when 2
            #TODO: resolve issue
            map = GoogleStaticMapsHelper::Map.new :size => '340x300', :sensor => true #, :zoom => map_zoom       
            marker = GoogleStaticMapsHelper::Marker.new({lng: longitude, lat: latitude, color: 'red', size: 'normal'})
            map << marker
            
            full_url = map.url        
        end
        %<<img src="#{full_url}">>.html_safe
    end
    
    def map
		return "Mapa del sitio"
	end	

end

