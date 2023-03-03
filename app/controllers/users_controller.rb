class UsersController < ApplicationController

    def show
        user = User.find_by(id: session[:user_id])
        if(user)
            render json: user, status: :ok, serializer: UserShowSerializer
        else
            render json: { error: "Unauthorized" }, status: :unauthorized
        end
    end

    def create
        new_user = User.create(user_params)
        if(new_user.valid?)
            session[:user_id] = new_user.id
            render json: new_user, status: :created
        else
            render json: { errors: new_user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    # Include password in the user_params, not password_digest
    def user_params
        params.permit(:username, :password)
    end

end
