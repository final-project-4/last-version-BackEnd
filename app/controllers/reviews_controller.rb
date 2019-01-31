class ReviewsController < ApplicationController

    before_action :set_review, only: [:show, :update, :destroy]
    def index 
        @reviews = Review.all  
        render json: @reviews  
    end
    
    
    def show
        render json: @review
    end
    
    
    def create 
        @review = Review.create(review_params)
        render json: @review
    end 
    
    def update 
        @review.update_attributes(review_params)
        render json: @review
    end
    
    
    
    def destroy
        @review.destroy
        render json: {message:"success"}
    end 
    
    
    private 
    
    def set_review
    @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(
        :comment, :raiting, :user_id, :product_id )
    end  
end
