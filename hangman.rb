dictionary = File.open('google-10000-english-no-swears.txt', 'r')
words = dictionary.read.split("\n")

def pick_word(array)
  array.select { |word| word.length.between?(5, 12) }.sample
end

pp pick_word(words)