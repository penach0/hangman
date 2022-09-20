# Holds all methods related to displaying the game
module Display
  def display_wrong_guesses(wrong_guesses, max_tries)
    puts "Wrong Guesses: #{wrong_guesses.join(' ').upcase}"
    puts "Number of tries left: #{max_tries - wrong_guesses.size}"
  end
end
