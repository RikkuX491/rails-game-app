class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games, status: :ok
    end

    def show
        game = Game.find_by(id: params[:id])
        if(game != nil)
            render json: game, status: :ok
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def create
        new_game = Game.create(title: params[:title], release_year: params[:release_year])
        if(new_game.valid?)
            render json: new_game, status: :created
        else
            render json: {errors: new_game.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        game = Game.find_by(id: params[:id])
        if(game != nil)
            if(new_game.valid?)
                game.update(params.permit(:title, :release_year))
                render json: game, status: :ok
            else
                render json: { errors: game.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def destroy
        game = Game.find_by(id: params[:id])
        if(game != nil)
            game.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def last_game
        last_game = Game.all.last
        if(Game.all.length > 0)
            render json: last_game, status: :ok
        else
            render json: { error: "Sorry, there are no games" }, status: :not_found
        end
    end
end
