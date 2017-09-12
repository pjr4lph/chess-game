require_relative "pieces.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    populate
  end

  def populate
    @grid.each_with_index do |row, row_idx|
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
        if row_idx == 1
          self[pos] = Pawn.new(self, pos, :black)
        elsif row_idx == 6
          self[pos] = Pawn.new(self, pos, :white)
        elsif pos == [0,0] || pos == [0,7]
          self[pos] = Rook.new(self, pos, :black)
        elsif pos == [7,0] || pos == [7,7]
          self[pos] = Rook.new(self, pos, :white)
        elsif pos == [0,1] || pos == [0,6]
          self[pos] = Knight.new(self, pos, :black)
        elsif pos == [7,1] || pos == [7,6]
          self[pos] = Knight.new(self, pos, :white)
        elsif pos == [0,2] || pos == [0,5]
          self[pos] = Bishop.new(self, pos, :black)
        elsif pos == [7,2] || pos == [7,5]
          self[pos] = Bishop.new(self, pos, :white)
        elsif pos == [0,3]
          self[pos] = Queen.new(self, pos, :black)
        elsif pos == [7,3]
          self[pos] = Queen.new(self, pos, :white)
        elsif pos == [0,4]
          self[pos] = King.new(self, pos, :black)
        elsif pos == [7,4]
          self[pos] = King.new(self, pos, :white)
        else
          self[pos] = NullPiece.instance
        end
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No Piece At Start" if self[start_pos].class == NullPiece
    raise "Out of bounds" if end_pos.any? {|i| i > 7 || i < 0}
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.instance
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def in_bounds(pos)
    return false if pos.any? {|i| i < 0 || i > 7}
    true
  end
end
