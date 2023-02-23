class ReviewsController < ApplicationController
    def index
        reviews = Review.all
        render json: reviews, status: :ok
    end

    def show
        review = Review.find_by(id: params[:id])
        if(review)
            render json: review, status: :ok
        else
            render json: { error: "Review Not Found"}, status: :not_found
        end
    end

    def create
        new_review = Review.create(game_id: params[:game_id], user_id: params[:user_id], rating: params[:rating])
        render json: new_review, status: :created
    end

    def update
        review = Review.find_by(id: params[:id])
        if(review)
            review.update(params.permit(:game_id, :user_id, :rating))
            render json: review, status: :ok
        else
            render json: { error: "Review Not Found" }, status: :not_found
        end
    end

    def destroy
        review = Review.find_by(id: params[:id])
        if(review)
            review.destroy
            head :no_content
        else
            render json: { error: "Review Not Found" }, status: :not_found
        end
    end
end