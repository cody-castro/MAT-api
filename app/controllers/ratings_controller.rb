class RatingsController < ApplicationController


def index
    @ratings = Rating.all
    render json: @ratings
end

# def new

# end

def create
    # binding.pry
    # @rating = Rating.create(params[user_id])
   @rating = Rating.create!(user_id: params["user_id"], location_id: params["location_id"], rating: params["rating"] , review: params["review"])
    render json: @rating
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


