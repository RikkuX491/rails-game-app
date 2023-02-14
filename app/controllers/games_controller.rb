class GamesController < ApplicationController
    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.find_by(id: params[:id])
        render json: game
    end

    def create
        new_game = Game.create(title: params[:title], release_year: params[:release_year])
        render json: new_game
    end

    def update
        game = Game.find_by(id: params[:id])
        game.update(params.permit(:title, :release_year))
        render json: game
    end

    def destroy
        game = Game.find_by(id: params[:id])
        game.destroy
        render json: {}
    end
end
