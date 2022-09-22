require_relative 'game'

system('clear')

def load_game?
  return if Dir.empty?('../saves')

  puts 'Do you want to load a game? (Y/N)'
  answer = ''
  loop do
    answer = gets.chomp
    break if %w[y n].include?(answer.downcase)

    puts 'Not a valid option'
  end
  answer == 'y'
end

load_game? ? Game.load.play : Game.new.play
