class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def get_move
    print "Enter position (1 - 9): "
    gets.chomp.to_i
  end
end