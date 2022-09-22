require_relative 'text_content'

# Holds all methods related to displaying the game
module Display
  include TextContent

  WIDTH = 30
  HEIGHT = 8

  def fill_array(array)
    array.map { |letter| letter.upcase}
         .fill(' ', array.size...8)
  end

  # Joins blank lines with the wrong guesses box
  def print_top_part(blank_lines, wrong_guesses)
    puts

    i = 1
    while i <= HEIGHT
      print blank_lines_box(blank_lines, i)
      puts wrong_guesses_box(fill_array(wrong_guesses), i)
      i += 1
    end
  end

  def blank_lines_box(blank_lines, i)
    border = '─' * (blank_lines.length + 2)
    case i
    when 1
      'GUESS THE WORD'.center(WIDTH, ' ')
    when 4
      "┌#{border}┐".center(WIDTH, ' ')
    when 5
      blank_lines.center(WIDTH, ' ')
    when 6
      "└#{border}┘".center(WIDTH, ' ')
    else
      ' ' * WIDTH
    end
  end

  def wrong_guesses_box(letters, i)
    case i
    when 1
      '       WRONG GUESSES     '
    when 2
      '  ╔═════════════════════╗'
    when 4
      "  ║   #{letters[0]}    #{letters[1]}    #{letters[2]}    #{letters[3]}  ║"
    when 6
      "  ║   #{letters[4]}    #{letters[5]}    #{letters[6]}    #{letters[7]}  ║"
    when 8
      '  ╚═════════════════════╝'
    else
      '  ║                     ║'
    end
  end

  def print_drawing(wrong_guesses)
    puts DRAWINGS[wrong_guesses.size]
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
    blank_lines.join(' ')
  end
end
