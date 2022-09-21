# Contains methods related to the saving games functionality
module Saves
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def serialize(file_name)
    save_name = file_name || ask_save_name
    file = File.open("../saves/#{save_name}.yaml", 'w')
    YAML.dump(self, file)
    file.close
  end

  def delete_save_file(file_name)
    File.delete("../saves/#{file_name}.yaml") unless file_name.nil?
  end

  # Save related class methods for Game
  module ClassMethods
    def saved_games
      Dir.children('../saves').map { |file| file.split('.')[0] }
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
end
