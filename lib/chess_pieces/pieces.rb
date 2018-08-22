class Piece
#  attr_accessor :x_pos, :y_pos
  attr_reader   :color, :moves

  def initialize(color)
    @moves = []
    @color = color
  end

  def is_valid?(pos,tar)
    res = []
    res << (tar[0] - pos[0])
    res << (tar[1] - pos[1])
    @moves.include?(res)
    # if move is within moves and is within board
    # return true
    # else return false
  end
=begin
  On new,
    takes position and color
    x coordinate = first val of position - editable
    y coordinate = second val of position - editable

  On legal moves,
    takes x and y
    depending on color and position on board,
    checks legal moves
    if move is legal,
    pushes move into an array
    if move is not legal,
    raises an error
=end
end
