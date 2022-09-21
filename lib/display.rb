require_relative 'text_content'

# Holds all methods related to displaying the game
module Display
  include TextContent

  def display_wrong_guesses(wrong_guesses, max_tries)
    tries_left = max_tries - wrong_guesses.size

    fill_array = wrong_guesses.map { |letter| letter.upcase}
                              .fill(' ', wrong_guesses.size...8)

    puts wrong_guesses_box(fill_array, tries_left)
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
    wrap_blank_lines(blank_lines.join(' '))
  end
end
