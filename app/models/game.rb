class Game < ApplicationRecord
  # has_many :guesses, dependent: :destroy
  def guesses
    # number
    []
  end

  def letters
    []
  end 

  def updated_guess
    "--ll--ns"
  end

end
