# Creates instances of new guesses
class Guess
  attr_reader :guess

  def initialize
    @guess = player_input
  end

  def player_input
    letter = ''
    loop do
      letter = gets.chomp.strip
      break if letter.size == 1 && letter.match?(/[a-zA-Z]/)

      puts "That's not a letter! Please try again:"
    end
    letter.downcase
  end
end
