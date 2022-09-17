# Stores the dictionary and its related operations
module Dictionary
  dictionary = File.open('google-10000-english-no-swears.txt', 'r')
  WORDS = dictionary.read.split("\n")

  def pick_word(array)
    array.select { |word| word.length.between?(5, 12) }.sample
  end
end

# Creates instance of the secret word
class SecretWord
  include Dictionary
  attr_reader :secret_word

  def initialize
    @secret_word = pick_word(WORDS)
  end
end

new_word = SecretWord.new
puts new_word.secret_word
