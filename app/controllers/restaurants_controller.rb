class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all
      end
  
      def show
      end
  
      def new
        @restaurant = Restaurant.new
      end
  
      def edit 
      end 

      def create
        # binding.pry
        @restaurant = Restaurant.new(restaurant_params)
        # binding.pry
        if @restaurant.save
          redirect_to restaurant_path(@restaurant)
        end
      end

      private

      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end
  
      def restaurant_params
        params.require(:restaurant).permit(:name, :location, :review, :stars)
      end
  end
