class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.find_by(id: params[:id])
        if(game)
            render json: game, status: :ok
        else
            render json: {error: "Game Not Found"}, status: :not_found
        end
    end

    def create
        new_game = Game.create(title: params[:title], release_year: params[:release_year])
        render json: new_game
    end

    def update
        game = Game.find_by(id: params[:id])
        if(game)
            game.update(params.permit(:title, :release_year))
            render json: game, status: :ok
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def destroy
        game = Game.find_by(id: params[:id])
        if(game)
            game.destroy
            render json: {}
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def last_game
        last_game = Game.all.last
        
        if(last_game == nil)
            render json: { error: "There are no games." }
        else
            render json: last_game
        end
    end
end
