class Spree::Location < ActiveRecord::Base
  belongs_to :locationable, polymorphic: true
            
  attr_accessible :latitude, :longitude 
  
  #TODO validades :latitude, :longitude 
end
