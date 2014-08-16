Spree::ProductsHelper.module_eval do

  # TODO: los valores por defecto sacarlos de Spree::Config::Location.default_latitude
  def product_map(product)
    variant = 1
    full_url = ''
    product.location ||= Spree::Location.new(0, 0)
    latitude = product.location.latitude
    longitude = product.location.longitude

    case variant
    when 0
      full_url = "/images/habana.jpg"
    when 1
      url = "http://maps.google.com/maps/api/staticmap"
      options = {}
      options[:size] = '338x244'
      options[:maptype] = 'roadmap'
      options[:format] = 'png32'
      options[:sensor] = 'false'
      options[:markers] = "#{latitude},#{longitude}"
      query_string = options.keys.collect{|key| "#{key}=#{options[key]}"}.join('&')
      full_url = "#{url}?#{query_string}"
    when 2
      # TODO: resolve issue?? (migue que problema hay aqui??)
      map = GoogleStaticMapsHelper::Map.new :size => '338x244', :sensor => true, :zoom => 7
      marker = GoogleStaticMapsHelper::Marker.new( :lng => longitude, :lat => latitude, :color => 'red', :size => 'normal')
      map << marker
      full_url = map.url
    end
    %<<img src="#{full_url}" width="338" height="244" alt="#{product.name} on the map">>.html_safe
  end


  def products_map(products)
    if products.any?
      variant = 1
      full_url = ''
      case variant
      when 1
        url = "http://maps.google.com/maps/api/staticmap"
        options = {}
        options[:size] = '220x220'
        options[:maptype] = 'roadmap'
        options[:format] = 'png32'
        options[:sensor] = 'false'
        options[:markers] = ""
        products.each do |product|
          if(!product.location.nil?)
            if(options[:markers] == "")
              options[:markers] << "#{product.location.latitude},#{product.location.longitude}"
            else
              options[:markers] << "|#{product.location.latitude},#{product.location.longitude}"
            end
          end
        end

        query_string = options.keys.collect{|key| "#{key}=#{options[key]}"}.join('&')
        full_url = "#{url}?#{query_string}"
      when 2
        map = GoogleStaticMapsHelper::Map.new :size => '220x220', :sensor => true, :zoom => 7
        marker = GoogleStaticMapsHelper::Marker.new( :lng => longitude, :lat => latitude, :color => 'red', :size => 'normal')
        map << marker
        full_url = map.url
      end
      %<<img src="#{full_url}" width="220" height="220" alt="listed items location on the map">>.html_safe

    end
  end

end

