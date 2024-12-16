require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @current_player = @player1
  end

  def play
    while game_over? != true
      @board.display
      move = @current_player.move

      if @board.valid_move?(move)
        @board.update(move, @current_player.symbol)
      else
        puts 'Invalid move. Try Again'
        next
      end

      if @board.check_winner
        puts "#{@current_player.name} wins!"
        break
      elsif @board.full?
        puts "It's a tie!"
        break
      end
      switch_player
    end
  end

  def game_over?
    if @board.check_winner
      puts "#{@current_player.Player.name} wins!"
      true
    else
      false
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

test = Game.new
test.play
