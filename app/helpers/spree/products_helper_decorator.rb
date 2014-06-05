Spree::ProductsHelper.module_eval do

  def product_map(product)
    #TODO: (peter si quieres has una rama develop o local, pero en el master del github no debe estar variat=0)
    variant = 1
    full_url = ''
    # TODO: los valores por defecto sacarlos de Spree::Config::Location.default_latitude
    product.location ||= Spree::Location.new(:latitude => 23.1341642187384, :longitude => -82.3605751991272)

    latitude = product.location.latitude
    longitude = product.location.longitude

    case variant
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
    %<<img src="#{full_url}" width="338" height="244" alt="item location on a map">>.html_safe
  end


  def products_map(products)
    if products.any?
      #TODO: (peter si quieres has una rama develop o local, pero en el master del github no debe estar variat=0)
      variant = 1
      full_url = ''
      # TODO: los valores por defecto sacarlos de Spree::Config::Location.default_latitude
      case variant
      when 1
        url = "http://maps.google.com/maps/api/staticmap"
        options = {}
        options[:size] = '338x244'
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
        # TODO: resolve issue?? (migue que problema hay aqui??)
        map = GoogleStaticMapsHelper::Map.new :size => '338x244', :sensor => true, :zoom => 7
        marker = GoogleStaticMapsHelper::Marker.new( :lng => longitude, :lat => latitude, :color => 'red', :size => 'normal')
        map << marker
        full_url = map.url
      end
      %<<img src="#{full_url}" width="338" height="244" alt="listed items location on the map">>.html_safe

    end
  end

  # def products_map(products)
  #   if products.any?
  #     #TODO: (peter si quieres has una rama develop o local, pero en el master del github no debe estar variat=0)
  #     variant = 1
  #     full_url = ''
  #     # TODO: los valores por defecto sacarlos de Spree::Config::Location.default_latitude
  #     products.first.location ||= Spree::Location.new(:latitude => 23.1341642187384, :longitude => -82.3605751991272)

  #     latitude = products.first.location.latitude
  #     longitude = products.first.location.longitude

  #     case variant
  #     when 1
  #       url = "http://maps.google.com/maps/api/staticmap"
  #       options = {}
  #       options[:size] = '338x244'
  #       options[:maptype] = 'roadmap'
  #       options[:format] = 'png32'
  #       options[:sensor] = 'false'
  #       options[:center] = "#{latitude},#{longitude}"
  #       options[:zoom] = 10
  #       markers = {}
  #       marker_front = "markers="
  #       products.each do |product|
  #         if(!product.location.nil?)
  #           markers[product.id] = ("#{product.location.latitude},#{product.location.longitude}")
  #         end
  #       end

  #       markers_query = markers.keys.collect{|key| "markers=#{markers[key]}"}.join('&')

  #       query_string = options.keys.collect{|key| "#{key}=#{options[key]}"}.join('&')
  #       query_string = query_string + '&' + markers_query
  #       full_url = "#{url}?#{query_string}"
  #     when 2
  #       # TODO: resolve issue?? (migue que problema hay aqui??)
  #       map = GoogleStaticMapsHelper::Map.new :size => '338x244', :sensor => true, :zoom => 7
  #       marker = GoogleStaticMapsHelper::Marker.new( :lng => longitude, :lat => latitude, :color => 'red', :size => 'normal')
  #       map << marker
  #       full_url = map.url
  #     end
  #     if markers.any?
  #       %<<img src="#{full_url}" width="338" height="244" alt="listed items location on the map">>.html_safe
  #     end
  #   end
  # end

end

