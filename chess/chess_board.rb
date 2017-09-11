require_relative "chess_piece.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    populate
  end

  def populate
    @grid.each_with_index do |row, row_idx|
      if row_idx <= 1 || row_idx >= 6
        row.map! { |el| Piece.new }
      else
        row.map! { |el| nil }
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise "No Piece At Start" unless self[start_pos].is_a?(Piece) #change later
    raise "Out of bounds" if end_pos.any? {|i| i > 7 || i < 0}
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
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

# a = Board.new
# puts a.grid
