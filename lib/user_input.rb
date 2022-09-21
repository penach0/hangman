# Holds all methods related to user prompts and its restrictions
module UserInput
  def ask_guess(all_guesses)
    letter = ''
    loop do
      puts 'Make a guess:'
      letter = gets.chomp.strip
      next if already_picked?(letter, all_guesses)

      break if letter.size == 1 && letter.match?(/[a-zA-Z]/)

      puts "That's not a letter! Please try again:"
    end
    letter.downcase
  end

  def already_picked?(guess, all_guesses)
    if all_guesses.include?(guess)
      puts 'You already picked that one, I\'ll give you one more try:'
      true
    end
  end

  def yes_or_no?
    answer = ''
    loop do
      answer = gets.chomp
      break if %w[y n].include?(answer.downcase)

      puts 'Not a valid option'
    end
    true if answer == 'y'
  end

  def save_game?(all_guesses)
    unless all_guesses.empty? # Checks if it is the first turn
      puts 'Do you want to save? (Y/N)'
      yes_or_no?
    end
  end

  def play_again?
    puts 'Want to play again? (Y/N)'
    yes_or_no?
  end

  def ask_save_name
    save_name = ''
    puts 'Enter a name for the save:'
    loop do
      save_name = gets.chomp
      break if save_name.match?(/\A[\w-]*\z/)

      puts 'Not a valid name'
    end
    save_name
  end

  def choose_saved_game(saved_games)
    puts 'Pick a saved game (enter the corresponding number):'
    saved_games.each.with_index(1) { |file, index| puts "#{index}. #{file}" }

    choice = ''
    loop do
      choice = gets.chomp.to_i
      break if [*1..saved_games.size].include?(choice)

      puts 'Not a valid option'
    end
    saved_games[choice - 1]
  end
end
