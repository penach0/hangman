require_relative 'user_input'

# Creates instances of new guesses
class Guess
  include UserInput
  attr_reader :guess
  
  def initialize(guess)
    @guess = guess
  end
end
