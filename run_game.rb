require 'byebug'
require_relative 'lib/errors.rb'
require_relative 'lib/player.rb'
require_relative 'lib/human_player.rb'
require_relative 'lib/computer_player.rb'
require_relative 'lib/board.rb'
require_relative 'lib/game.rb'

def play_against_computer?
  puts "Would you like to play against the computer? (y/n)"
  input = gets.chomp
  input.downcase == "y"
end

def get_board_size
  size = 0
  puts "What size board? (between 3 and 10)"
  until size >= 3 && size <= 9
    input = gets.chomp
    size = input.to_i
    if size < 3 || size > 9
      puts "That is not a valid board size"
    end
  end

  size
end

if $PROGRAM_NAME == __FILE__
  play_against_computer = play_against_computer?
  board_size = get_board_size

  game = Game.new(computer: play_against_computer, smarter_computer: true, size: board_size)
  game.play
end
