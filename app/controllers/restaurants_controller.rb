class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    def index
      @restaurants = Restaurant.search(params[:search])
    end
  
    def show
    end
  
    def new
      @restaurant = Restaurant.new
      @restaurant.reviews.build
    end

    def create
        # binding.pry
      @restaurant = current_user.restaurants.build(restaurant_params)
      #  binding.pry
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new, notice: "Could not create restaurant"
      end
    end

    def edit 
    end 

    def update
      if @restaurant
        @restaurant.update(restaurant_params)
        if @restaurant.errors.any?
          render "edit"
        else
          redirect_to @restaurant
        end
      else
        render "edit", notice: "Could not edit this restaurant"
      end
    end
  
    def destroy
      @restaurant.destroy
      redirect_to restaurants_path
    end

    private

    def set_restaurant
      @restaurant = Restaurant.find_by_id(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :search, reviews_attributes: [:id, :message, :stars, :user_id, :restaurant_id])
    end 
end
