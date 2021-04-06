class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  # curl -X POST http://localhost:3000/games
  def create
    @game = Game.create(word: "Balloons")
    render json: {game_id: @game.id, word_length: @game.word.length }
  end

  # curl -X GET http://localhost:3000/games/:id
  def show
    @game = Game.find(params[:id])

    render json: {number_of_guesses: @game.guesses.count, dashes: @game.updated_guess}
  end
end
