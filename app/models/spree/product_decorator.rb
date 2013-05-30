Spree::Product.class_eval do
  has_one :location, :as => :locationable  
  attr_accessible :location_id, :locationable, :locationable_type, :locationable_id, :location   
  accepts_nested_attributes_for :location
  
  def locationable?
	location.latitude.present? and map.longitude.present? and
	map.latitude != 0.0   and map.longitude != 0.0      
  end
  
  
end
