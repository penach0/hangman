require_relative 'secret_word'
require_relative 'guess'
require_relative 'display'
require_relative 'user_input'
require_relative 'saves'
require 'yaml'

# Contains logic of the gameplay
class Game
  include Display
  include UserInput
  include Saves
  attr_reader :secret_word, :wrong_guesses, :all_guesses, :file_name

  MAX_WRONG_TRIES = 8

  def initialize(secret_word = nil, wrong_guesses = [], all_guesses = [], file_name = nil)
    @secret_word = secret_word || SecretWord.new
    @wrong_guesses = wrong_guesses || []
    @all_guesses = all_guesses || []
    @file_name = file_name
    display_all
  end

  def self.load
    file_name = game_file(saved_games, pick_saved_game(saved_games))
    file = File.open("../saves/#{file_name}.yaml", 'r')
    saved_game = YAML.safe_load(file, permitted_classes: [Game, SecretWord])
    file.close

    new(
      saved_game.secret_word,
      saved_game.wrong_guesses,
      saved_game.all_guesses,
      file_name
    )
  end

  def play
    loop do
      turn
      display_all
      break delete_save_file(file_name) if game_result

      return serialize(file_name) if save_game?(all_guesses)
    end
    new_game if play_again?
  end

  def turn
    guess = Guess.new(ask_guess(all_guesses)).guess
    secret_word.update_word_state(secret_word.check_guess(guess), guess)
    add_guesses(guess)
  end

  def display_all
    system('clear')
    display_game_result(game_result, secret_word)
    print_top_part(display_word_state(secret_word.blank_lines), wrong_guesses)
    print_drawing(wrong_guesses)
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

  def new_game
    Game.new.play
  end
end
