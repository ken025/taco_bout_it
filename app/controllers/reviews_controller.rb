class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :new, :create]
  before_action :set_review,  only: [:show, :edit, :update, :destroy]


  def index
    if params[:restaurant_id]
      set_restaurant
      @reviews = @restaurant.reviews
    else
      @reviews = Review.order(:updated_at || :created_at).reverse
    end
  end

  def show
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
    # binding.pry
    
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
         redirect_to restaurant_review_path(@restaurant, @review)
      else
        redirect_to @review 
      end
    else
      render :new, notice: "Could not create review"
    end
  end

  def edit
    # if !current_user.id = @review.user_id
    # redirect_to restaurant_review_path, notice: "Unable to edit this review" 
    # end 
  end

  def update
    if @review
      @review.update(review_params)
      if @review.errors.any?
        render "edit"
      else
        redirect_to restaurant_review_path
      end
    else
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to restaurant_reviews_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by_id(params[:restaurant_id])
  end

  def set_review
    @review = Review.find_by_id(params[:id])
  end

  def review_params
    params.require(:review).permit(:message, :stars)
  end 
end 