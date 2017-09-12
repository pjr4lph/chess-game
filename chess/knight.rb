class Knight < Piece
  include SteppingPiece
  attr_reader :symbol

  def initialize(board, starting_pos, color)
    @symbol = "H "
  end
end
