require 'spec_helper'

describe "Product Show" do

  context 'as standard user' do

    subject{ page }

    let!(:productlocation) {FactoryGirl.create(Spree::Location)}

    let!(:product) {create(:product, :name => 'apache baseball cap', :price => 10, :location => productlocation)}

    it "shows a map with the correct location" do
      visit spree.product_path(product)
      should have_content('Map')
      should have_css('img[src="http://maps.google.com/maps/api/staticmap?size=338x244&maptype=roadmap&format=png32&sensor=false&markers=23.129,-82.38"]')
    end
  end
end