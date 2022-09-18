require_relative 'secret_word'
require_relative 'guess'

# Contains logic of the gameplay
class Game
  attr_reader :secret_word

  MAX_WRONG_TRIES = 8

  def initialize
    @secret_word = SecretWord.new
    puts secret_word.secret_word
  end

  def play
    i = 0
    while i < MAX_WRONG_TRIES
      puts secret_word.display_word_state
      guess = Guess.new
      secret_word.update_word_state(secret_word.check_guess(guess.guess), guess.guess)
      i += 1
    end
  end
end
