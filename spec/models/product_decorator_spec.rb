require 'spec_helper'

describe Spree::Product do  
  let!(:productlocation) {FactoryGirl.create(Spree::Location)}  
  let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}        
  
  it 'haves a location' do        
    product.location.should_not be_nil
  end
  
end