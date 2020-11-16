class UsersController < ApplicationController

    def show
        if user_signed_in?
        @user = current_user 
        end
    end 

    def index
    if params[:restaurant_id]
        @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        @users = @restaurant.users
    end 
    end
end 