# Stores the templates of the display of the game
module TextContent
  WIDTH = 22

  def wrap_blank_lines(blank_lines)
    height = 5

    i = 0
    while i < height
      puts blank_lines.center(WIDTH, ' ') if i == 3
      puts ' ' * WIDTH
      i += 1
    end
  end

  def wrong_guesses_box(wrong_guesses, tries_left)
    a = wrong_guesses
    <<~HEREDOC
         WRONG GUESSES
    ************************
    *                      *
    *   #{a[0]}    #{a[1]}    #{a[2]}    #{a[3]}   *
    *                      *
    *   #{a[4]}    #{a[5]}    #{a[6]}    #{a[7]}   *
    *                      *
    ************************
    Number of tries left: #{tries_left}
    HEREDOC
  end

  DRAWINGS = [
    ("\n" * 12),
    <<~'HEREDOC',
     _______________
    |/_/_/_/_/_/_/_/|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
    _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                  |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
   _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
     |            |_|
     |            |_|
     |            |_|
     |            |_|
                  |_|
                  |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
  _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
     |            |_|
    /|            |_|
   / |            |_|
     |            |_|
                  |_|
                  |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
     _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
     |            |_|
    /|\           |_|
   / | \          |_|
     |            |_|
                  |_|
                  |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
    _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
     |            |_|
    /|\           |_|
   / | \          |_|
     |            |_|
    /             |_|
   /              |_|
                 /_-_\
     HEREDOC
     <<~'HEREDOC',
   _______________
    |/_/_/_/_/_/_/_/|
                  |_|
    _ __          |_|
   ||0 0|         |_|
   \\_-/          |_|
     |            |_|
    /|\           |_|
   / | \          |_|
     |            |_|
    / \           |_|
   /   \          |_|
                 /_-_\
    HEREDOC
    <<~'HEREDOC',
  _______________
    |/_/_/_/_/_/_/_/|
     |            |_|
    _|__          |_|
   ||x x|         |_|
   \\_-/          |_|
     |            |_|
    /|\           |_|
   / | \          |_|
     |            |_|
    / \           |_|
   /   \          |_|
                 /_-_\
 HEREDOC
  ]
end
