class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        
        # Check if the user exists and if bcrypt can authorize it
        # .authenticate is a special method given to us by bcrypt where we will pass the password as the parameter.
        # The password will be encrypted to see if this password, when encrypted, will match the password that is stored in the database for that specific user
        # if(user&.authenticate) is equivalent to if(user && user.authenticate)
        if(user&.authenticate(params[:password]))
            session[:user_id] = user.id
            render json: user, status: :ok, serializer: UserShowSerializer
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
end
