Spree::Admin::ProductsController.class_eval do

  before_filter :set_location, :only => :update
  before_filter :initialize_location, :only => :edit
  after_filter :fix_db, :only => :update

  protected
    def set_location      
      location = Spree::Location.find_by_locatable_id(Spree::Product.find_by_name(params[:product][:name]).id)      
      latitude = params[:product][:location][:latitude]
      longitude = params[:product][:location][:longitude]
      params[:product][:location] = location
      params[:product][:location][:latitude] = latitude
      params[:product][:location][:longitude] = longitude      
    end

    def fix_db      
      loc = Spree::Location.find_by_locatable_id(nil)
      loc.locatable_id = Spree::Product.find_by_name(params[:product][:name]).id
      Spree::Product.find_by_name(params[:product][:name]).location = loc
    end

    def initialize_location      
      prod = Spree::Product.find_by_permalink(params[:id])
      if(prod.location.nil?)         
        Spree::Location.create(:locatable_id => prod.id, :locatable_type => 'Spree::Product', :latitude => "0.0", :longitude => "0.0")
        prod.location = Spree::Location.find_by_locatable_id(prod.id)
      end
    end
end
