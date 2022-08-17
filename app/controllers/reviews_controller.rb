class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new 
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        @review.save 
        if @review.save
            redirect_to restaurant_path(@review.restaurant)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def review_params
        params.require(:review).permit(:rating, :content)
    end

end
