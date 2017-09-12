class King < Piece
  include SteppingPiece

  attr_reader :symbol

  def initialize(board, starting_pos, color)
    @symbol = "K "
    super
  end
end
