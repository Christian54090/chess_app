require_relative 'pieces'

class Knight < Piece

  def initialize(color)
    @moves = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
    super
  end

  def piece
    @color == 'w' ? "\u2658" : "\u265E"
  end

end
