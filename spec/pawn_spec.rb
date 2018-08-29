require 'chess_pieces/pawn'

describe Pawn do
  before(:each) do
    @pawn  = Pawn.new('b')
    @board = [['a','b','c'],['d',' ','f'],['g','h','i'],[' ','k','l']]
  end

  describe '#piece' do

    context 'Returns a piece' do
      it { expect(@pawn.piece).to eql("\u265F") }
    end

  end

  describe '#blocked?' do

    context 'Returns false if not blocked' do
      it { expect(@pawn.blocked?(@board,[0,1])).to eql(false) }
    end

    context 'Returns true if blocked' do
      it { expect(@pawn.blocked?(@board,[1,1])).to eql(true) }
    end

  end

  describe '#diagonal?' do

    context 'Returns false if diagonal is empty space' do
      it { expect(@pawn.diagonal?(@board,[1,1])).to eql(false) }
    end

    context 'Returns true if diagonal is not empty space' do
      it { expect(@pawn.diagonal?(@board,[2,1])).to eql(true) }
    end
  end

  describe '#is_valid?' do

    context 'Returns false given invalid coordinates' do
      it { expect(@pawn.is_valid?(@board,[1,2],[2,2])).to eql(false) }
    end

    context 'Returns true given valid coordinates' do
      it { expect(@pawn.is_valid?(@board,[0,1],[1,1])).to eql(true) }
    end

    context 'Returns true given double forward on first move' do
      it { expect(@pawn.is_valid?(@board,[0,2],[2,2])).to eql(true) }
    end

    context 'Returns true given a valid diagonal move' do
      it { expect(@pawn.is_valid?(@board,[1,1],[2,2])).to eql(true)}
    end

  end
end
