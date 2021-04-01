class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(word: "Balloon")
    render json: "\n Game ID: #{@game.id}" + "\n Word: #{@game.word} \n"
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
