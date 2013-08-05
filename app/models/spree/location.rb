class Spree::Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true
  attr_accessible :latitude, :longitude

  # TODO validades :latitude, :longitude
end
