class ReviewsController < ApplicationController
    def index
        reviews = Review.all
        render json: reviews
    end

    def show
        review = Review.find_by(id: params[:id])
        render json: review
    end

    def create
        new_review = Review.create(game_id: params[:game_id], user_id: params[:user_id], rating: params[:rating])
        render json: new_review
    end

    def update
        review = Review.find_by(id: params[:id])
        review.update(params.permit(:game_id, :user_id, :rating))
        render json: review
    end

    def destroy
        review = Review.find_by(id: params[:id])
        review.destroy
        render json: {}
    end
end