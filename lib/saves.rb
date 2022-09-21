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
    include UserInput

    def saved_games
      Dir.children('../saves').map { |file| file.split('.')[0] }
    end

    def game_file(saved_games, choice)
      saved_games[choice - 1]
    end
  end
end
