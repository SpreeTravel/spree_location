Spree::Product.class_eval do
  has_one :location, :as => :locatable, class_name: "Spree::Location"
  accepts_nested_attributes_for :location, :allow_destroy => true

  after_save :set_default_location

  def set_default_location
    unless self.location
      Spree::Location.create_location_for(self)
    end
  end

  def set_location(options = {})
    set_default_location
    self.reload
    l = self.location
    l.longitude = options[:longitude]
    l.latitude = options[:latitude]
    l.save
  end
end
