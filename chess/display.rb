require "colorize"
require_relative "cursor.rb"
require_relative "chess_board.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render ## change this when we change to nilpiece
    system('clear')
    @board.grid.size.times do |i|
      @board.grid.size.times do |j|
        background = nil
        if (i.even? && j.even?) || (i.odd? && j.odd?)
          background = :light_red
        else
          background = :light_black
        end
        background = :light_cyan if @cursor.cursor_pos == [i,j]
        pos = [i, j]
        if @board[pos].nil?
          print "  ".colorize(background: background)
        else
          print "--".colorize(color: :yellow, background: background)
        end
        puts "" if j == 7
      end
    end
  end

  def play
    while true
      render
      @cursor.get_input
    end
  end
end

a = Board.new
d = Display.new(a)
d.play
# puts String.colors
