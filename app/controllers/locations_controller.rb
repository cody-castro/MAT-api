class LocationsController < ApplicationController
   

    def index
        @locations = Location.all
        render geojson: @locations
    end
    
    # def new
    
    # end
    
    def create
        @location = Location.create(location_params)
    end
    
    # def edit
    
    # end
    
    # def update
    
    # end
    
    def show
        @location = Location.find(params[:id])
        render geojson: @location
    end
    
    # def destroy
    
    # end
    private
    
    def location_params
        params.require(:location).permit(:name, :location_category, :ada, :ada_type)
    end
    

end
