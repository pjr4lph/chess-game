require "byebug"

class Piece

  attr_reader :board, :color
  attr_accessor :current_pos

  def initialize(board, starting_pos, color)
    @current_pos = starting_pos
    @board = board
    @color = color
  end

  def moves
    raise "Moves method not defined!"
  end

end


require_relative "pieces.rb"


#
# b = Array.new(8) { Array.new(8) }
# c = Pawn.new(b, [0, 0], "black")
# print c.moves
