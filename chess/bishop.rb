class Bishop < Piece
include SlidingPiece
  def initialize(board, starting_pos)
    @diagonal = true
    @hor_vert = false
    super
  end

end
