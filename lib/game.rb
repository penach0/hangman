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
      secret_word.display_word_state
      guess = Guess.new.guess
      secret_word.update_word_state(secret_word.check_guess(guess), guess)
      add_wrong_guesses(guess)
      display_wrong_guesses
      game_result
    end
  end

  def add_wrong_guesses(guess)
    wrong_guesses << guess unless secret_word.letters.include?(guess)
  end

  def display_wrong_guesses
    puts "Wrong Guesses: #{wrong_guesses.join(' ').upcase}"
    puts "Number of tries left: #{MAX_WRONG_TRIES - wrong_guesses.size}"
  end

  def game_result
    if wrong_guesses.size == MAX_WRONG_TRIES
      show_secret_word
      secret_word.display_word_state
      puts 'No more tries, you lost the game...'
    elsif secret_word.letters == secret_word.blank_lines
      puts 'Congratulations! You found the word and won the game!!'
    end
  end

  def show_secret_word
    secret_word.blank_lines = secret_word.letters
  end
end
