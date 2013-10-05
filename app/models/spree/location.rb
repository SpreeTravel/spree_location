class Spree::Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true

  # TODO validades :latitude, :longitude
end
