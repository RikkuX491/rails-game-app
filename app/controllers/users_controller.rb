class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: :ok
    end

    def show
        user = User.find_by(id: params[:id])
        if(user)
            render json: user, status: :ok
        else
            render json: { error: "User Not Found"}, status: :not_found
        end
    end

    def create
        new_user = User.create(name: params[:name])
        render json: new_user, status: :created
    end

    def update
        user = User.find_by(id: params[:id])
        if(user)
            user.update(params.permit(:name))
            render json: user, status: :ok
        else
            render json: { error: "User Not Found" }, status: :not_found
        end
    end

    def destroy
        user = User.find_by(id: params[:id])
        if(user)
            user.destroy
            head :no_content
        else
            render json: { error: "User Not Found" }, status: :not_found
        end
    end
end
