Spree::Product.class_eval do
  has_one :location, :as => :locationable
    
#  define_index do
#	has location.locationable_id, :as => :locationable_id
#	has "RADIANS(locations.lat)", :as => :latitude, :type => :float
#	has "RADIANS(locations.lng)", :as => :longitude, :type => :float
#  end
  
  def locationable?
	location.latitude.present? and map.longitude.present? and
	map.latitude != 0.0   and map.longitude != 0.0      
  end

end
