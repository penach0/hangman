# hangman
Classic pen-and-paper hangman game implementation on the command line. Written in Ruby.

Instructions

- Pick a letter at each turn to try to guess the secret word. You get 8 tries.
- Games can be saved at any moment and saved games can be loaded at the beginning of
the game.

Credits:

- Title screen from https://ascii-generator.site/t/. Pretty cool resource!

Lessons learned:

- How to make a RegExp check all characters in a string, very useful to restrict user input
- Create a module that can both be included and extend a class, in other words the same 
module can provide both instance and class methods to a class
- Modules can include other modules
- Commit a empty directory with .gitkeep

To do:

- Look into the ncurses library to start building more polished terminal applications, it is
very difficult to display the elements on the screen as I want and I always end up making
concessions