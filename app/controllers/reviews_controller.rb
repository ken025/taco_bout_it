class ReviewsController < ApplicationController
  before_action :set_review,  only: [:show]

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
      @review = Review.new
    end
  end

  def create
    binding.pry
    
    if params[:restaurant_id]
      set_restaurant
      @review = @restaurant.reviews.build(review_params)
      @review.user_id =  current_user.id
    else
      @review = current_user.reviews.build(review_params)
  # binding.pry
     end
    if @review.save
      if @restaurant
      # redirect_to review_path(@review)
    
      # binding.pry
      # if @restaurant
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
    @review = Review.find_by_id(params[:id])
  end

  def review_params
    params.require(:review).permit(:message, :stars, :review_id)
  end 
end 

# class ReviewsController < ApplicationController
#     before_action :set_review,  only: [:show]

#     def index
#       if params[:restaurant_id]
#         @reviews = set_restaurant.reviews
#         # set_restaurant
#         # @reviews = @restaurant.reviews
#       else
#         @reviews = Review.all
#       end
#     end
  
#     def show
#       if params[:restaurant_id]
#         @review = set_restaurant.reviews.find(params[:id])
#         # set_restaurant
#       else 
#         set_review
#       end
#     end
  
#     def new
#       if params[:restaurant_id] && !Restaurant.exists?(params[:restaurant_id])
#         redirect_to restaurants_path
#         # set_restaurant
#         # @review = @restaurant.reviews.build
#       else
#         @review = Review.new[restaurant_id: params[:restaurant_id]]
#       end
#     end
  
#     def create
#       # binding.pry
#       @review = Review.new(review_params)
#       @review.save
#       redirect_to review_path(@review)

#     #   if params[:restaurant_id]
#     #     set_restaurant
#     #     @review = @restaurant.reviews.build(review_params)
#     #     @review.user_id =  current_user.id
#     #   else
#     #     @review = current_user.reviews.build(review_params)
#     # # binding.pry
#     #    end
#     #   if @review.save
#     #     if @restaurant
#     #     redirect_to review_path(@review)
      
#     #     # binding.pry
#     #     # if @restaurant
#     #       # redirect_to restaurant_review_path(@restaurant, @review)
#     #     else
#     #       redirect_to @review
#     #     end
#     #   else
#     #     render :new
#     #   end
#      end
  
#     def edit
#       if params[:restaurant_id]
#         restaurant = Restaurant.find_by(id: params[:restaurant_id])
#         if restaurant.nil?
#           redirect_to restaurants_path
#         else
#           @review = restaurant.reviews.find_by(id: params[:id])
#           redirect_to restaurant_reviews_path(restaurant), alert: "review not found." if @review.nil?
#         end
#       else
#         @review = Review.find(params[:id])
#       end
#     end
    
  
#     def update
#       @review = Review.find(params[:id])
#       @review.update(review_params)
#       redirect_to review_path(@review)
#     end
  
#     def destroy
#     end
  
#     private
  
#     def set_restaurant
#       @restaurant = Restaurant.find_by_id(params[:restaurant_id])
#     end
  
#     def set_review
#       @review = Review.find_by_id(params[:id])
#     end
  
#     def review_params
#       params.require(:review).permit(:message, :stars, :review_id)
#     end 
#   end 
