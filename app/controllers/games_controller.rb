class GamesController < ApplicationController

    # The code inside of the authorize method will run before any controller action.
    before_action :authorize

    # before_action will not call the authorize method before the index action.
    skip_before_action :authorize, only: [:index]

    # Action to handle GET request to get all games '/games'.
    def index
        # Retrieve all of the games from the database with Game.all and store it in a variable.
        games = Game.all

        # Render the data for the games, and return an HTTP status code of :ok (202).
        # :ok (202) is the standard response for successful HTTP requests.
        render json: games, status: :ok
    end

    # Action to handle GET request to get one game '/games/:id'
    def show
        game = Game.find_by(id: params[:id])
        if(game != nil)
            render json: game, status: :ok, serializer: GameShowSerializer
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    # Action to handle POST request to create a new game '/games'
    def create
        new_game = Game.create(title: params[:title], release_year: params[:release_year])
        if(new_game.valid?)
            render json: new_game, status: :created
        else
            render json: {errors: new_game.errors.full_messages}, status: :unprocessable_entity
        end
    end

    # Action to handle PATCH request to update a game '/games/:id'
    def update
        game = Game.find_by(id: params[:id])
        if(game != nil)
            if(game.valid?)
                game.update(params.permit(:title, :release_year))
                render json: game, status: :ok
            else
                render json: { errors: game.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    # Action to handle DELETE request to destroy a game '/games/:id'
    def destroy
        game = Game.find_by(id: params[:id])
        if(game != nil)
            game.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    # This is a custom action that will render the last game from the database '/get_last_game'
    def last_game
        last_game = Game.all.last
        if(Game.all.length > 0)
            render json: last_game, status: :ok
        else
            render json: { error: "Sorry, there are no games" }, status: :not_found
        end
    end

    # The code inside of this method will run before any controller action.
    def authorize

        # If the user is not logged in, the Not Authorized error message will be rendered.
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end
end
