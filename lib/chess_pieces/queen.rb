require_relative 'pieces'
require './lib/chess_pieces/bishop.rb'
require './lib/chess_pieces/rook.rb'

class Queen < Piece

  def initialize(color)
    @moves = [Bishop.new('b').moves, Rook.new('b').moves].flatten
    super
  end

  def piece
    @color == 'w' ? "\u2655" : "\u265B"
  end

end
