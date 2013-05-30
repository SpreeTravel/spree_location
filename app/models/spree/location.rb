class Spree::Location < ActiveRecord::Base
  belongs_to :locationable, :polymorphic => true
  attr_accessible  :locationable, :latitude, :longitude
  validates_presence_of :latitude, :longitude, :locationable
end
