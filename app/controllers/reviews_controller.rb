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
        new_review = Review.create(review_params)
        if(new_review.valid?)
            render json: new_review, status: :created
        else
            render json: { errors: new_review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        review = Review.find_by(id: params[:id])
        if(review)
            review.update(review_params)
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

    private
    
    def review_params
        params.permit(:game_id, :user_id, :rating)
    end
end