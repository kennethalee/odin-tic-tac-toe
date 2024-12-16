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
      puts '--+---+--' unless index == @board.size - 1
    end
  end

  def valid_move?(position)
    return false if position > 9

    true
  end

  def update(position, symbol)
    return unless valid_move?(position)

    row = (position - 1) / 3
    col = (position - 1) % 3
    @board[row][col] = symbol
  end

  def check_winner
    if row_winner || column_winner || diagonal_winner
      true
    else
      false
    end
  end

  def row_winner
    return true if @board.each do |row|
      row.uniq.size == 1 && %w[X O].include?(row.first)
    end

    false
  end

  def column_winner
    transposed_board = @board.transpose
    return true if transposed_board.any? do |col|
      col.uniq.size == 1 && %w[X O].include?(col.first)
    end

    false
  end

  def diagonal_winner
    n = @board.size
    primary_diagonal = (0...n).map { |i| @board[i][i] }
    secondary_diagonal = (0...n).map { |i| @board[i][n - 1 - i] }

    return true if [primary_diagonal, secondary_diagonal].any? do |diagonal|
      diagonal.uniq.size == 1 && %w[X O].include?(diagonal.first)
    end

    false
  end
end
