require_relative 'dictionary'

# Creates instance of the secret word
class SecretWord
  include Dictionary
  attr_reader :secret_word, :letters
  attr_accessor :blank_lines

  def initialize
    @secret_word = pick_word
    @letters = secret_word.split('')
    @blank_lines = Array.new(secret_word.length, '_')
  end

  def update_word_state(correct_positions, guess)
    blank_lines.each_index do |index|
      blank_lines[index] = guess if correct_positions.include?(index)
    end
    blank_lines
  end

  def check_guess(guess)
    correct_positions = []
    letters.each_with_index do |letter, index|
      correct_positions << index if letter == guess
    end
    correct_positions
  end
end
