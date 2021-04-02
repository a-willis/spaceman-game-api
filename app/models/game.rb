class Game < ApplicationRecord
  # has_many :guesses, dependent: :destroy
  def guesses
    []
  end

  # if word is "balloons" and guesses contain "l" and "n",
  # then return "--ll--ns"
  def updated_guess
    "--ll--ns"
  end

  # @word_dashes = ""
  # @game.word.length.times do
  #   @word_dashes += "_ "
  # end
end
