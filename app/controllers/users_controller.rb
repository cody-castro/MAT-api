class UsersController < ApplicationController

def index
    @users = User.all
    render json: @users
end

# def new

# end

def create
    @user = User.create(user_params)
    render json: @user
end

# def edit

# end

# def update

# end

def show
    @user = User.find(params[:id])
    render json: @user
end

# def destroy

# end
private

def user_params
    params.require(:user).permit(:name, :password, :bio)
end

end

