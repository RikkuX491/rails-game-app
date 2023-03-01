class UsersController < ApplicationController
    # def index
    #     users = User.all
    #     render json: users, status: :ok
    # end

    def show
        user = User.find_by(id: session[:user_id])
        if(user)
            render json: user, status: :ok, serializer: UserShowSerializer
        else
            render json: { error: "Unauthorized"}, status: :unauthorized
        end
    end

    def create
        new_user = User.create(username: params[:username])
        if(new_user.valid?)
            session[:user_id] = new_user.id
            render json: new_user, status: :created
        else
            render json: { errors: new_user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # def update
    #     user = User.find_by(id: params[:id])
    #     if(user)
    #         user.update(params.permit(:username))
    #         render json: user, status: :ok
    #     else
    #         render json: { error: "User Not Found" }, status: :not_found
    #     end
    # end

    # def destroy
    #     user = User.find_by(id: params[:id])
    #     if(user)
    #         user.destroy
    #         head :no_content
    #     else
    #         render json: { error: "User Not Found" }, status: :not_found
    #     end
    # end
end
