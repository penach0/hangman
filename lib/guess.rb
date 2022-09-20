require_relative 'user_input'

# Creates instances of new guesses
class Guess
  include UserInput
  attr_reader :guess

  @@all_guesses = []
  def self.all_guesses
    @@all_guesses
  end

  def self.reset_guesses
    @@all_guesses = []
  end

  def initialize
    @guess = ask_guess(@@all_guesses)
    @@all_guesses << guess
  end
end
