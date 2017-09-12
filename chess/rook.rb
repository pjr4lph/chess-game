class Rook < Piece
include SlidingPiece

attr_reader :symbol

  def initialize(board, starting_pos, color)
    @hor_vert = true
    @diagonal = false
    @symbol = "R "
    super
  end

end
