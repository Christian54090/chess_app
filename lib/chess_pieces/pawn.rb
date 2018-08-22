require_relative 'pieces'

class Pawn < Piece

  def initialize(color)
    @moves = []
    super
  end

  def piece
    @color == 'w' ? "\u2659" : "\u265F"
  end

  def is_valid?(pos,tar)
#    @color = 'w' ? @moves = @moves.slice()
    res = []
    res << (tar[0] - pos[0])
    res << (tar[1] - pos[1])
    @moves.include?(res)
  end

end

# Have to make it so it can't take pieces in front of it
# And can take pieces at a diagonal
