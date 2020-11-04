class ReviewsController < ApplicationController
    before_action :set_review, only: [:show]

    def index
      if params[:restaurant_id]
        set_restaurant
        @reviews = @restaurant.reviews
      else
        @reviews = Review.all
      end
    end
  
    def show
      if params[:restaurant_id]
        set_restaurant
      end
    end
  
    def new
      if params[:restaurant_id]
        set_restaurant
        @review = @restaurant.reviews.build
      else
        @ieview = Review.new
      end
    end
  
    def create
      if params[:restaurant_id]
        set_restaurant
        @review = @restaurant.reviews.build(review_params)
      else
        @review = Review.new(review_params)
      end
      if @review.save
        if @restaurant
          redirect_to restaurant_review_path(@restaurant, @review)
        else
          redirect_to @review
        end
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end
  
    private
  
    def set_restaurant
      @restaurant = Restaurant.find_by_id(params[:restaurant_id])
    end
  
    def set_review
      @ieview = Review.find_by_id(params[:id])
    end
  
    def review_params
      params.require(:review).permit(:message, :stars :restaurant_id)
    end
  
  end
end 