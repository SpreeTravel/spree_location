class Spree::Location < ActiveRecord::Base
  belongs_to :locationable, :polymorphic => true
  attr_accessible  :locationable, :latitude, :longitude, :locationable_type, :locationable_id
  
  validates_presence_of :latitude, :longitude, :locationable
end
