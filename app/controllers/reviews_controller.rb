class ReviewsController < ApplicationController

    before_action :set_review, only: [:show, :update, :destroy]
    def index 
        @product = Product.find(params[:product_id])
        @review = @product.reviews
        render json: @review  
    end
    
    
    def show
        render json: @review
    end
    
    
    def create 
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
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
        params.require(:review).except(:user_id).permit(
        :comment, :raiting, :name )
    end  
end
