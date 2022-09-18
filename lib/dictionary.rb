# Stores the dictionary and its related operations
module Dictionary
  dictionary = File.open('../google-10000-english-no-swears.txt', 'r')
  WORDS = dictionary.read.split("\n")

  def pick_word
    WORDS.select { |word| word.length.between?(5, 12) }.sample
  end
end
