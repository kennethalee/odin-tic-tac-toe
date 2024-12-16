class Board
  def initialize
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end
  
  def display
    @board.each_with_index do |row, index|
      puts row.join(' | ')
      puts "--+---+--" unless index == @board.size - 1
    end
  end

  def valid_move?(position)
    if position > 9
      return false
    else
      true
    end
  end

  def update(position, symbol)
    if valid_move?(position)
      row = (position - 1) / 3
      col = (position - 1) % 3
      @board[row][col] = symbol
    end
  end

  def check_winner
    # check row 
    return true if @board.any? {
      |row| row.uniq.size == 1 && ["X", "O"].include?(row.first) 
    }

    # check column
    transposed_board = @board.transpose
    return true if transposed_board.any? {
      |col| col.uniq.size == 1 && ["X", "O"].include?(col.first)
    }
    
    # check diagonal
    n = @board.size
    primary_diagonal = (0...n).map { |i| @board[i][i] }
    secondary_diagonal = (0...n).map { |i| @board[i][n - 1 - i] }

    return true if [primary_diagonal, secondary_diagonal].any? {
      |diagonal| diagonal.uniq.size == 1 && ["X", "O"].include?(diagonal.first)
    }

    false
  end
end


# Tests
test = Board.new()
test.update(3, "X")
test.update(6, "X")
test.update(0, "X")
test.update(1, "X")
test.display
p test.check_winner

