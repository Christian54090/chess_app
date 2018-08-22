require_relative 'pieces'

class Bishop < Piece

  def initialize(color)
    @moves = [[1,1],[1,-1],[-1,1],[-1,-1],[2,2],[2,-2],[-2,2],[-2,-2],
              [3,3],[3,-3],[-3,3],[-3,-3],[4,4],[4,-4],[-4,4],[-4,-4],
              [5,5],[5,-5],[-5,5],[-5,-5],[6,6],[6,-6],[-6,6],[-6,-6],
              [7,7],[7,-7],[-7,7],[-7,-7],[8,8],[8,-8],[-8,8],[-8,-8]]
    super
  end

  def piece
    @color == 'w' ? "\u2657" : "\u265D"
  end

end