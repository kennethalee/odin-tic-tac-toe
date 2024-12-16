class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def move
    print "\n#{@name}, enter your move(1 - 9): "
    gets.chomp.to_i
  end
end
