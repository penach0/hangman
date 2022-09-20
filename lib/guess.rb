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
    @guess = ask_guess
    @@all_guesses << guess
  end

  def already_picked?(guess)
    if @@all_guesses.include?(guess)
      puts 'You already picked that one, I\'ll give you one more try:'
      true
    end
  end
end
