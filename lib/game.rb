require_relative 'secret_word'
require_relative 'guess'
require_relative 'display'
require 'yaml'

# Contains logic of the gameplay
class Game
  include Display
  include UserInput
  attr_reader :secret_word, :wrong_guesses, :all_guesses

  MAX_WRONG_TRIES = 8

  def initialize(secret_word = nil, wrong_guesses = [], all_guesses = [])
    @secret_word = secret_word || SecretWord.new
    @wrong_guesses = wrong_guesses || []
    @all_guesses = all_guesses || []
  end

  def self.load
    file = File.open('../saves/test.yaml', 'r')
    saved_game = YAML.safe_load(file, permitted_classes: [Game, SecretWord])
    file.close

    new(
      saved_game.secret_word,
      saved_game.wrong_guesses,
      saved_game.all_guesses
    )
  end

  def play
    display_all
    while wrong_guesses.size < MAX_WRONG_TRIES
      unless all_guesses.empty?
        if save_game?
          serialize
          return
        end
      end
      turn
      display_all
      break if game_result == 'won'
    end
    new_game if play_again?
  end

  def turn
    guess = Guess.new(ask_guess(all_guesses)).guess
    secret_word.update_word_state(secret_word.check_guess(guess), guess)
    add_guesses(guess)
  end

  def display_all
    display_game_result(game_result, secret_word)
    display_word_state(secret_word.blank_lines)
    display_wrong_guesses(wrong_guesses, MAX_WRONG_TRIES)
  end

  def add_guesses(guess)
    wrong_guesses << guess unless secret_word.letters.include?(guess)
    all_guesses << guess
  end

  def game_result
    if wrong_guesses.size == MAX_WRONG_TRIES
      'lost'
    elsif secret_word.letters == secret_word.blank_lines
      'won'
    end
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
    Game.new.play
  end

  def save_game?
    puts 'Do you want to save? (Y/N)'
    answer = ''
    loop do
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Not a valid option'
    end
    answer == 'y'
  end

  def serialize
    file = File.open('../saves/test.yaml', 'w')
    YAML.dump(self, file)
    file.close
  end
end
