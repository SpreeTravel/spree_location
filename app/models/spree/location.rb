class Spree::Location < ActiveRecord::Base
  belongs_to :locatable, :polymorphic => true
  validates :latitude, :numericality => { :greater_than_or_equal_to => -90, :less_than_or_equal_to => 90 }
  validates :longitude, :numericality => { :greater_than_or_equal_to => -180, :less_than_or_equal_to => 180 }
end
