class Bishop < Piece
include SlidingPiece

attr_reader :symbol

  def initialize(board, starting_pos, color)
    @diagonal = true
    @hor_vert = false
    @symbol = "B "
    super
  end

end
