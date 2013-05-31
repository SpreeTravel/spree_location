class Spree::Location < ActiveRecord::Base
  belongs_to :locationable, :polymorphic => true
  attr_accessible  :locationable, :latitude, :longitude, :locationable_type, :locationable_id, :location_id, :location_type
  
  validates_presence_of :latitude, :longitude, :locationable
end
