require "singleton"
class NullPiece < Piece
  include Singleton
  def initialize
    @color = "grey"
    @symbol = '  '
  end
end
