require 'chess_helpers'

describe ChessHelpers do
  let(:dummy_class) { Class.new { extend ChessHelpers } }
  before(:each) do
    @board = [[1,2,3],[4,5,6],[7,' ',9]]
    @lib   = { a: 'b', c: 'd', e: 'f' }
  end

  describe '#str_in_board?' do

    context 'Returns true for strings in board' do
      it { expect(dummy_class.str_in_board?('A4')).to eql(true) }
    end

    context 'Returns false for strings not in board' do
      it { expect(dummy_class.str_in_board?('I9')).to eql(false) }
    end

  end

  describe '#arr_in_board?' do

    context 'Returns true for arrays in board' do
      it { expect(dummy_class.arr_in_board?([1,1])).to eql(true) }
    end

    context 'Returns false for arrays not in board' do
      it { expect(dummy_class.arr_in_board?([9,9])).to eql(false) }
    end

  end

  describe '#in_board?' do

    context 'Returns true given a valid string' do
      it { expect(dummy_class.in_board?('A4')).to eql(true) }
    end

    context 'Returns false given an invalid string' do
      it { expect(dummy_class.in_board?('I9')).to eql(false) }
    end

    context 'Returns true given a valid array' do
      it { expect(dummy_class.in_board?([1,1])).to eql(true) }
    end

    context 'Returns false given an invalid array' do
      it { expect(dummy_class.in_board?([9,9])).to eql(false) }
    end

  end

  describe '#correct_format?' do

    context 'Returns true given a correct string' do
      it { expect(dummy_class.correct_format?('A4 A5')).to eql(true) }
    end

    context 'Returns false given an incorrect string' do
      it { expect(dummy_class.correct_format?('A56A9')).to eql(false) }
    end

    context 'Returns false given a string not in_board' do
      it { expect(dummy_class.correct_format?('A9 A5')).to eql(false) }
    end

  end

  describe '#convert_str' do

    context 'Returns array given a string' do
      it { expect(dummy_class.convert_str('A5')).to eql([5,1]) }
    end

    context 'Returns different array given another string' do
      it { expect(dummy_class.convert_str('B6')).to eql([6,2]) }
    end

  end

  describe '#convert_input' do

    context 'Returns array given correct input' do
      it { expect(dummy_class.convert_input('A4 A5')).to eql([[4,1],[5,1]]) }
    end

    context 'Returns different array given different correct input' do
      it { expect(dummy_class.convert_input('A6 A7')).to eql([[6,1],[7,1]]) }
    end

    context 'Returns invalid given an incorrect string' do
      it { expect(dummy_class.convert_input('I9 H7')).to eql('invalid') }
    end

  end

  describe '#fit_to_board' do

    context 'Returns fitted array' do
      it { expect(dummy_class.fit_to_board([4,1])).to eql([5,1]) }
    end

    context 'Returns another fitted array' do
      it { expect(dummy_class.fit_to_board([7,7])).to eql([8,13]) }
    end

  end

  describe '#chessboard_index' do

    context 'Returns a value given a layered array' do
      it { expect(dummy_class.chessboard_index(@board,1,2)).to eql(6) }
    end

  end

  describe '#piece_shown' do

    context 'Returns a value given a hash' do
      it { expect(dummy_class.piece_shown(@lib,:a)).to eql('b') }
    end

  end

  describe '#empty_space?' do

    context 'Returns true given an empty space' do
      it { expect(dummy_class.empty_space?(@board,[2,1])).to eql(true) }
    end

    context 'Returns false given a non-empty space' do
      it { expect(dummy_class.empty_space?(@board,[1,1])).to eql(false) }
    end

  end
end
