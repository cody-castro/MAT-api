class RatingsController < ApplicationController
   
def index
    @ratings = Rating.all
    render json: @ratings
end

# def new

# end

def create
    @rating = Rating.create(rating_params)
end

# def edit

# end

# def update

# end

def show
    @rating = Rating.find(params[:id])
    render json: @rating
end

# def destroy

# end

private

def rating_params
    params.require(:rating).permit(:user_id, :location_id, :rating, :review)
end

end
