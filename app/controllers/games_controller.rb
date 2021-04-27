class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @game = Game.new
  end

  # curl -X POST http://localhost:3000/games
  def create
    @game = Game.create

    render json: {game_id: @game.id}
  end

  # curl -X GET http://localhost:3000/games/:id
  def show
    @game = Game.find(params[:id])

    render json: {guesses: @game.guesses}
  end

  def edit
  end 

  def update
    @game = Game.find(params[:id])

    new_guess = params[:guess]
    @game.guesses = @game.guesses.concat(new_guess)

    @game.save!

    render json: {guess: @game.guesses}
  end 
end 
