# Stores the dictionary and its related operations
module Dictionary
  dictionary = File.open('google-10000-english-no-swears.txt', 'r')
  WORDS = dictionary.read.split("\n")

  def pick_word
    WORDS.select { |word| word.length.between?(5, 12) }.sample
  end
end

# Creates instance of the secret word
class SecretWord
  include Dictionary
  attr_reader :secret_word, :letters, :blank_lines

  def initialize
    @secret_word = pick_word
    @letters = secret_word.split('')
    @blank_lines = Array.new(secret_word.length, '_')
  end

  def display_word_state
    blank_lines.join(' ')
  end

  def check_guess(guess)
    correct_positions = []
    letters.each_with_index do |letter, index|
      correct_positions << index if letter == guess
    end
    puts correct_positions
  end
end

new_word = SecretWord.new
puts new_word.secret_word
puts new_word.display_word_state
new_word.check_guess('a')
