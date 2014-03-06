require 'spec_helper'

describe "Product Show" do

  context 'as standard user' do
    
    subject{ page }

    let!(:productlocation) {FactoryGirl.create(Spree::Location)}
    
    let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}        

    it "shows a map with the correct location" do        
      visit spree.root_path
      should have_content('Map')
      within ("data-hook.product_map") do
        should have_css('img src.http://maps.google.com/maps/api/staticmap?size=338x244&maptype=roadmap&sensor=false&markers=23.129,-82.38,blue&center=23.129,-82.38&zoom=9')
      end
    end
  end
end