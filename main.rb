require_relative 'lib/game'

TITLE = <<-'HEREDOC'.freeze






888    888
888    888
888    888
8888888888  8888b.  88888b.   .d88b.  88888b.d88b.   8888b.  88888b.
888    888     "88b 888 "88b d88P"88b 888 "888 "88b     "88b 888 "88b
888    888 .d888888 888  888 888  888 888  888  888 .d888888 888  888
888    888 888  888 888  888 Y88b 888 888  888  888 888  888 888  888
888    888 "Y888888 888  888  "Y88888 888  888  888 "Y888888 888  888
                                  888
                             Y8b d88P
                              "Y88P"







Press Enter to play
HEREDOC

system('clear')
print TITLE
gets.chomp

def load_game?
  return if Dir.glob('*.yaml', base: 'saves').empty?

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
