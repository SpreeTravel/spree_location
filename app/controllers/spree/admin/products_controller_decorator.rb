Spree::Admin::ProductsController.class_eval do

  before_filter :set_location, :only => :update
  before_filter :initialize_location, :only => :edit
  after_filter :fix_db, :only => :update
  before_filter :delete_location, :only => :destroy

  protected
    def set_location
      if not params[:product][:location].nil?
        location = Spree::Location.find_by_locatable_id(@product.id)
        latitude = params[:product][:location][:latitude]
        longitude = params[:product][:location][:longitude]
        params[:product][:location] = location
        params[:product][:location][:latitude] = latitude
        params[:product][:location][:longitude] = longitude
      end
    end

    def fix_db
      loc = Spree::Location.find_by_locatable_id(nil)
      if not loc.nil?
        loc.locatable_id = @product.id
        @product.location = loc
      end
    end

    def initialize_location
      @product.location = @product.location || Spree::Location.create(:locatable_id => @product.id, :locatable_type => 'Spree::Product', :latitude => "0.0", :longitude => "0.0")
    end

    def delete_location
      loc = Spree::Location.find_by_locatable_id(@product.id)
      loc.destroy()
    end
end
