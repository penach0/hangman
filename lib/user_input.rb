# Holds all methods related to user prompts and its restrictions
module UserInput
  def ask_guess
    letter = ''
    loop do
      puts 'Make a guess:'
      letter = gets.chomp.strip
      next if already_picked?(letter)

      break if letter.size == 1 && letter.match?(/[a-zA-Z]/)

      puts "That's not a letter! Please try again:"
    end
    letter.downcase
  end
end