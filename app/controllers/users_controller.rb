class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create
        new_user = User.create(name: params[:name])
        render json: new_user
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(params.permit(:name))
        render json: user
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
        render json: {}
    end
end
