class Piece
  attr_reader   :color, :moves
  attr_accessor :has_moved

  def initialize(color)
    @moves     = []
    @color     = color
    @has_moved = false
  end

  def is_valid?(board,pos,tar)
    res = []
    res << (tar[0] - pos[0]) << (tar[1] - pos[1])
    @moves.include?(res)
  end
end
