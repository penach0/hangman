require_relative 'secret_word'

new_word = SecretWord.new
puts new_word.secret_word
puts new_word.display_word_state

i = 0
while i < 10
  guess = gets.chomp
  new_word.update_word_state(new_word.check_guess(guess), guess)
  puts new_word.display_word_state
  i += 1
end
