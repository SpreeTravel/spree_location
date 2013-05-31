module LocationHelper
    def product_map(product)
		return "Mapa del sitio"
        variant = 1		        
        full_url = ''
        case variant
        when 0
            full_url = '/assets/staticmap.png'
        when 1
            url = "http://maps.google.com/maps/api/staticmap"
            options = {}
            options[:size] = '340x255'
            options[:maptype] = 'roadmap'
            options[:sensor] = 'false'
            lat = product.location.latitude  unless product.location.latitude.blank? else 61.1631 end
            lon = product.location.longitude unless product.location.latitude.blank? else -149.9721 end
            options[:markers] = "#{lat},#{lon},blue"
            options[:center] = "#{lat},#{lon}"
            options[:zoom] = 15
            query_string = options.keys.collect{|key| "#{key}=#{options[key]}"}.join('&')
            full_url = "#{url}?#{query_string}"
        end
        %<<img src="#{full_url}">>.html_safe
    end
    def map
		return "Mapa del sitio"
	end	

end

