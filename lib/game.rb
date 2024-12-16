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
    until game_over?
      display_board
      handle_player_move
      check_game_status
      switch_player unless game_over?
    end
  end

  private

  def display_board
    @board.display
  end

  def handle_player_move
    loop do
      move = @current_player.move
      if @board.valid_move?(move)
        @board.update(move, @current_player.symbol)
        break
      else
        puts 'Invalid move. Try Again'
      end
    end
  end

  def check_game_status
    if @board.check_winner
      announce_winner
    elsif @board.full?
      announce_tie
    end
  end

  def announce_winner
    puts "#{@current_player.name} wins!"
  end

  def announce_tie
    puts "It's a tie!"
  end

  def announce_turn
    puts "#{@current_player.name}'s turn."
  end

  def game_over?
    @board.check_winner || @board.full?
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end
