require 'spec_helper'

describe "Product Form" do

  context 'as Admin user' do

    #spree helper to enter as admin
    stub_authorization!
    
    subject{ page }
    
    let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10)}    

    before(:each) do
      visit spree.admin_path
    end 

    it "has the fields to add latitude and longitude" do      
      visit spree.admin_product_path(product)      
      within('.right.four.columns.omega') do
        should have_content('Latitude')
        should have_content('Longitude')
      end
    end

    it "saves the latitude and longitude" do
      visit spree.admin_product_path(product)
      within('.right.four.columns.omega') do
        fill_in('product_location_latitude', :with => '23.129')
        fill_in('product_location_longitude', :with => '-82.38')
      end
      within '.form-buttons.filter-actions.actions' do
        click_button('Update')
      end

      product.location.latitude.should be_equal(23.129)
      product.location.longitude.should be_equal(-82.38)

      should have_content('Map')
      within ("#item_map") do
        should have_css('img[src="http://maps.google.com/maps/api/staticmap?size=338x244&maptype=roadmap&format=png32&sensor=false&center=23.129,-82.38&zoom=10&markers=23.129,-82.38"]')
      end
    end 
  end
end