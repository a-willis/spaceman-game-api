class GuessesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @guesses = Guess.all
    render json: @guesses
  end

  def new
    @guess = Guess.new
  end

  # curl -X POST http://localhost:3000/guesses
  def create
    @guess = Guess.create(letter_guessed: 'q', game_id: 3)
    @guess.save

    @attempted_guesses = Guess.where(game_id: 3).count
    @letters_guessed = Guess.pluck(:letter_guessed)

    @dashes = ""
    @guess.game.word.length.times do
      @dashes += "_ "
    end

    render json: "\n
                    GAME STATUS: \n\n" +
      "length of word: #{@dashes}\n" +
      "# of attempted guesses: #{@attempted_guesses} \n" +
      "letters guessed: #{@letters_guessed} \n"
  end

  def show
    @guess = Guess.find(params[:id])
    render json: @guess
  end

  def edit
    @guess = Guess.find(params[:id])
  end

  def update
    @guess = Guess.find(params[:id])
    render json: @guess
  end

end
