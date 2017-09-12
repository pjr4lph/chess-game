class Rook < Piece
include SlidingPiece
  def initialize(board, starting_pos)
    @hor_vert = true
    @diagonal = false
    super
  end

end
