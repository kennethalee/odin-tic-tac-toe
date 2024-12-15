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
    if row_winner || col_winner || diagonal_winner
      true
    else
      false
    end
  end
  
  def row_winner
    @board.each do |row|
      return true if row.all? { |symbol| symbol == "X" } || 
                     row.all? { |symbol| symbol == "O"}
    end
    false
  end
  
  def col_winner
    @board.transpose.each do |row|
      return true if row.all? { |symbol| symbol == "X" } ||
                     row.all? { |symbol| symbol == "O"}
    end
    false
  end
  
  def diagonal_winner
    n = @board.size
    primary_diagonal, secondary_diagonal = [], []
    for i in 0..n - 1
      primary_diagonal << @board[i][i]
      secondary_diagonal << @board[i][n - 1 - i]
    end
    if primary_diagonal.all? { |symbol| symbol == "X"} || 
       primary_diagonal.all? { |symbol| symbol == "O"} || 
       secondary_diagonal.all? { |symbol| symbol == "X"} || 
       secondary_diagonal.all? { |symbol| symbol == "O"}
       return true
    end
    false
  end
end

test = Board.new()
test.update(5, "O")
test.update(10, "X")
p test.check_winner

