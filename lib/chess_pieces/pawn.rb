require_relative 'pieces'

class Pawn < Piece

  def initialize(color)
    @moves = [[1,0],[-1,0]]
    super
  end

  def piece
    @color == 'w' ? "\u2659" : "\u265F"
  end

  def is_valid?(board,pos,tar)
    @color == 'b' ? (move = @moves[0]) : (move = @moves[1])

    if diagonal?(board,tar)
      @color == 'b' ? (move << [1,1] << [1,-1]) : (move << [-1,1] << [-1,-1])
    end

    if @has_moved == false
      @color == 'b' ? (move << [2,0]) : (move << [-2,0])
    end

    res = []
    res << (tar[0] - pos[0]) << (tar[1] - pos[1])
    move.include?(res)
  end

  def diagonal?(board,tar)
    board[tar[0]][tar[1]] != ' '
  end

end

# Have to make it so it can't take pieces in front of it
# And can take pieces at a diagonal
