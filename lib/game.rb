require_relative 'secret_word'
require_relative 'guess'

# Contains logic of the gameplay
class Game
  attr_reader :secret_word, :wrong_guesses

  MAX_WRONG_TRIES = 8

  def initialize
    @secret_word = SecretWord.new
    @wrong_guesses = []
    puts secret_word.secret_word
  end

  def play
    while wrong_guesses.size < MAX_WRONG_TRIES
      puts secret_word.display_word_state
      guess = Guess.new.guess
      secret_word.update_word_state(secret_word.check_guess(guess), guess)
      add_wrong_guesses(guess)
      display_wrong_guesses
    end
  end

  def add_wrong_guesses(guess)
    wrong_guesses << guess unless secret_word.letters.include?(guess)
  end

  def display_wrong_guesses
    puts "Wrong Guesses: #{wrong_guesses.join(' ').upcase}"
    puts "Number of tries left: #{MAX_WRONG_TRIES - wrong_guesses.size}"
  end
end
