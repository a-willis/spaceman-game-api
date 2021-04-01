class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
end
