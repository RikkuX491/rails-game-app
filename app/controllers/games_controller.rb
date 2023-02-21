class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games, except: [:created_at, :updated_at], status: :ok
    end

    def show
        game = Game.find_by(id: params[:id])
        if(game != nil)
            render json: game, include: [:reviews, :users], status: :ok
        else
            render json: { error: "Game Not Found" }, status: :not_found
        end
    end

    def create
        new_game = Game.create(title: params[:title], release_year: params[:release_year])
        render json: new_game, status: :created
    end

    def update
        game = Game.find_by(id: params[:id])
        if(game != nil)
            game.update(params.permit(:title, :release_year))
            render json: game, status: :ok
        else
            render json: { error: "Game Not Found" }
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
            render json: last_game
        else
            render json: { error: "Sorry, there are no games" }
        end
    end
end
