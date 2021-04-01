class GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(word: "Balloon")
    render json: @game.id
  end

  def show
    @game = Game.find(params[:id])

    render json: "word: #{@game.word}"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    render json: @game
  end
end
