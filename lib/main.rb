require_relative 'game'

TITLE = <<-'HEREDOC'.freeze


 _    _ 
| |  | |
| |__| |  __ _  _ __    __ _  _ __ ___    __ _  _ __
|  __  | / _` || '_ \  / _` || '_ ` _ \  / _` || '_ \
| |  | || (_| || | | || (_| || | | | | || (_| || | | |
|_|  |_| \__,_||_| |_| \__, ||_| |_| |_| \__,_||_| |_|
                        __/ |
                       |___/



Press any key to play

HEREDOC

system('clear')
puts TITLE
gets.chomp

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
