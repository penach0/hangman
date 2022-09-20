# Holds all methods related to displaying the game
module Display
  def display_wrong_guesses(wrong_guesses, max_tries)
    puts "Wrong Guesses: #{wrong_guesses.join(' ').upcase}"
    puts "Number of tries left: #{max_tries - wrong_guesses.size}"
  end

  def display_game_result(game_result, secret_word)
    case game_result
    when 'lost'
      secret_word.blank_lines = secret_word.letters # Shows the secret word
      puts 'No more tries, you lost the game...'
    when 'won'
      puts 'Congratulations! You found the word and won the game!!'
    end
  end

  def display_word_state(blank_lines)
    puts blank_lines.join(' ')
    puts
  end
end
