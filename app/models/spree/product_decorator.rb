Spree::Product.class_eval do
  has_one :location, :as => :locatable, class_name: "Spree::Location"  
  accepts_nested_attributes_for :location, :allow_destroy => true
end
