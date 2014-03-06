FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_location/factories'
  factory Spree::Location do |l|
    l.latitude 23.129
    l.longitude -82.38
  end
end
