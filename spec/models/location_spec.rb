require 'spec_helper'

describe Spree::Location do
  it 'haves a valid factory' do
    FactoryGirl.create(Spree::Location).should be_valid            
  end
  it 'validates latitude lower bound correctly' do
    FactoryGirl.build(Spree::Location, latitude: -91).should_not be_valid            
  end
  it 'validates latitude upper bound correctly' do               
    FactoryGirl.build(Spree::Location, latitude: 91).should_not be_valid            
  end
  it 'validates longitude lower bound correctly' do
    FactoryGirl.build(Spree::Location, longitude: -181).should_not be_valid            
  end
  it 'validates longitude upper bound correctly' do
    FactoryGirl.build(Spree::Location, longitude: 181).should_not be_valid            
  end
end