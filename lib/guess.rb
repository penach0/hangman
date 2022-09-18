# Creates instances of new guesses
class Guess
  attr_reader :guess

  @@all_guesses = []

  def initialize
    @guess = player_input
    @@all_guesses << guess
  end

  def player_input
    letter = ''
    loop do
      letter = gets.chomp.strip
      next if already_picked?(letter)

      break if letter.size == 1 && letter.match?(/[a-zA-Z]/)

      puts "That's not a letter! Please try again:"
    end
    letter.downcase
  end

  def already_picked?(guess)
    if @@all_guesses.include?(guess)
      puts 'You already picked that one, I\'ll give you one more try:'
      true
    end
  end
end
