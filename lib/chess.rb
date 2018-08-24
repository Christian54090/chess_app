require 'yaml'
require_relative 'chess_helpers'
Dir["chess_pieces/*"].each{ |file| require_relative file }

class Chess
  include ChessHelpers
  attr_accessor :turns, :board
  attr_reader   :lib

  def initialize
    @turns = 0
    @board = [[' ','A',' ','B',' ','C',' ','D',' ','E',' ','F',' ','G',' ','H'],
              ['1',Rook.new('b').piece,' ',Knight.new('b').piece,' ',Bishop.new('b').piece, ' ', Queen.new('b').piece,
               ' ',King.new('b').piece,' ',Bishop.new('b').piece,' ',Knight.new('b').piece, ' ',Rook.new('b').piece],
              ['2',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,
               ' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece],
              ['3',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['4',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['5',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['6',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['7',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,
               ' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece],
              ['8',Rook.new('w').piece,' ',Knight.new('w').piece,' ',Bishop.new('w').piece, ' ', Queen.new('w').piece,
               ' ',King.new('w').piece,' ',Bishop.new('w').piece,' ',Knight.new('w').piece, ' ',Rook.new('w').piece]]
    @lib = {}
  end

  def move(pos,tar,col)
    case
    when !clear(@board,pos,col) then puts "invalid"; game
    when  clear(@board,tar,col) then puts "invalid"; game
    else
      if piece_shown(@lib,pos).is_valid?(@board,pos,tar)
        piece_shown(@lib,pos).has_moved = true
        @board[tar[0]][tar[1]] = @board[pos[0]][pos[1]]
        @board[pos[0]][pos[1]] = ' '
      else
        return 'invalid'
      end
    end
  end

  def game
    (0..8).each{ |n| @board[n].each{ |a| print a }; puts ' ' }

    @turns % 2 != 0 ? (turn = "Black's turn, "; col = 'b')
                    : (turn = "White's turn, "; col = 'w')

    puts "\nAt any point, type 'save' or 'quit' for those actions"
    print turn; puts "Example input: A2 A3"
    print '> '; choice = gets.chomp.upcase.split

    case
    when  choice.include?('SAVE')  then save_game; game
    when  choice.include?('QUIT')  then quit_game
    when !correct_format?(choice)  then return 'invalid input'
    else
      pos = convert_input(choice)[0]
      tar = convert_input(choice)[1]
      if move(fit_to_board(pos),fit_to_board(tar)) == 'invalid'
        return 'invalid move'
      else
        move(fit_to_board(pos),fit_to_board(tar),col)
        checkmate?(col); stalemate?
        @turns += 1; game
      end
    end
  end

  def checkmate?(color)
    color == 'b' ? (anti = 'w') : (anti = 'b')
    quit_game("Checkmate!") if !(@board.include?(piece))
  end

  def stalemate?
    quit_game("Stalemate!") if !(@board.any?{ |w| piece_shown(w) == King })
  end

  def main_menu
    puts "Please choose a number"
    puts "---------------"
    puts "[1] New Game\n[2] Load Game\n[3] Quit"
    puts "---------------"

    print '> '; choice = gets.chomp.to_i
    case choice
    when 1 then new_game
    when 2 then load_game
    when 3 then quit_game
    else   puts "Hint: Pick from the numbers"; main_menu
    end
  end

  def new_game
    chess = Chess.new
    chess.game
  end

  def save_game
    File.open("saves/game.yaml", 'w'){ |file| file.write(YAML::dump(self)) }
    puts "Game has been saved!"
  end

  def load_game
    if File.exist?("saves/game.yaml")
      save = YAML::load(File.read("saves/game.yaml"))
      @board = save.board
      @turns = save.turns
      puts "Welcome back!"; game
    else
      puts "No saved files exist"; main_menu
    end
  end

  def quit_game(string="")
    puts string
    exit(0)
  end
end

game = Chess.new
game.main_menu
