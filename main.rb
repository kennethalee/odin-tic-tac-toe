require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

begin
  puts "Welcome to Tic-Tac-Toe!"
  start_game = Game.new
  start_game.play
rescue StandardError => e
  puts "An error occured: #{e}"
end
