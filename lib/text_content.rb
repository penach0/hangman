# Stores the templates of the display of the game
module TextContent
  WIDTH = 22
  HEIGHT = 5

  def wrap_blank_lines(blank_lines)
    i = 0
    while i < HEIGHT
      puts blank_lines.center(WIDTH, ' ') if i == 3
      puts ' ' * WIDTH
      i += 1
    end
  end
end
