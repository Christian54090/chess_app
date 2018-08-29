module ChessHelpers

  # Checks if coordinate in string is in board
  def str_in_board?(str)
    (/^[A-H][1-8]$/ =~ str) == 0
  end

  # Checks if converted coordinate is in board
  def arr_in_board?(arr)
    arr.select{ |n| (1..8).include?(n) }.size == 2
  end

  # Checks if coordinate is in board regardless of whether it's converted
  def in_board?(obj)
    obj.class == String ? str_in_board?(obj) : arr_in_board?(obj)
  end

  # Checks if input is in the desired format
  def correct_format?(str)
    str.include?(' ') && in_board?(str.split[0]) && in_board?(str.split[1])
  end

  # Converts string into usable array
  def convert_str(str)
    [ str.chars[1].to_i, (('A'..'G').to_a.index(str.chars[0]) + 1) ]
  end

  # Converts full input into usable array
  def convert_input(str)
    if correct_format?(str)
      return [convert_str(str.split[0]), convert_str(str.split[1])]
    else
      return 'invalid'
    end
  end

  # Fits array to board
  def fit_to_board(arr)
    [ (arr[0] + 1), ((arr[1] * 2) - 1) ]
  end

  # Returns the object on the board
  def chessboard_index(board,row,col)
    board[row][col]
  end

  # Checks piece shown on board and returns a class
  def piece_shown(lib,index)
    lib[index]
  end

  # Checks if index is empty space
  def empty_space?(board,arr)
    chessboard_index(board,arr[0],arr[1]) == ' '
  end

  # Checks if index is your team's color.
  def same_team?(lib,board,arr,col)
    piece_shown(lib,chessboard_index(board,arr[0],arr[1])).color == col
  end

  # Checks if index is empty space or other team's color.
  def clear?(lib,board,arr,col)
    empty_space?(board,arr) || !same_team?(lib,board,arr,col)
  end
end
