require_relative 'secret_word'
require_relative 'guess'

# Contains logic of the gameplay
class Game
  attr_reader :secret_word, :wrong_guesses

  MAX_WRONG_TRIES = 8

  def initialize
    @secret_word = SecretWord.new
    @wrong_guesses = []
    secret_word.display_word_state
    puts secret_word.secret_word
  end

  def play
    while wrong_guesses.size < MAX_WRONG_TRIES
      turn
      display_all
      break if game_result == 'won'
    end
    new_game if play_again?
  end

  def turn
    guess = Guess.new.guess
    secret_word.update_word_state(secret_word.check_guess(guess), guess)
    add_wrong_guesses(guess)
  end

  def display_all
    display_wrong_guesses
    display_game_result(game_result)
    secret_word.display_word_state
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
      'lost'
    elsif secret_word.letters == secret_word.blank_lines
      'won'
    end
  end

  def display_game_result(game_result)
    case game_result
    when 'lost'
      show_secret_word
      puts 'No more tries, you lost the game...'
    when 'won'
      puts 'Congratulations! You found the word and won the game!!'
    end
  end

  def show_secret_word
    secret_word.blank_lines = secret_word.letters
  end

  def play_again?
    puts 'Want to play again? (Y/N)'
    answer = ''
    loop do
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Not a valid option'
    end
    answer == 'y'
  end

  def new_game
    Guess.reset_guesses
    Game.new.play
  end
end