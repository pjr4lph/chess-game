
class Queen < Piece
include SlidingPiece

attr_reader :symbol

  def initialize(board, starting_pos, color)
    @diagonal = true
    @hor_vert = true
    @symbol = "Q "
    super
  end
end
