FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_location/factories'
  factory Spree::Location do |l|
    l.latitude 23.129
    l.longitude -82.38
  end

  factory :my_product, class: Spree::Product do
    name "The Product"
    description { generate(:random_description) }
    price 19.99
    cost_price 17.00
    sku 'ABC'
    available_on { 1.year.ago }
    deleted_at nil
    shipping_category { |r| Spree::ShippingCategory.first || r.association(:shipping_category) }

    # ensure stock item will be created for this products master
    before(:create) { create(:stock_location) if Spree::StockLocation.count == 0 }

    after(:create) do |p|
      p.variants_including_master.each { |v| v.save! }
    end
  end

end
