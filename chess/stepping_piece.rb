module SteppingPiece
  @@knight_moves = [
    [1, 2],
    [-1, -2],
    [1, -2],
    [-1, 2],
    [2, 1],
    [-2, -1],
    [2, -1],
    [-2, 1]
  ]

  @@king_moves = [
    [1, 1],
    [-1, -1],
    [-1, 1],
    [1, -1],
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1]
  ]

  def move_dirs
    if self.class == King
      @@king_moves
    else
      @@knight_moves
    end
  end

  def moves
    possible_moves = []
    move_dirs.each.with_index do |move, idx|
      temp_move = []
      temp_move << move[0] + @current_pos[0]
      temp_move << move[1] + @current_pos[1]
      possible_moves << temp_move
    end

    new_possible_moves = possible_moves.reject { |move| move.any? {|move_idx| move_idx < 0 || move_idx >= @board.grid.size}}
    move_check(new_possible_moves)
  end

  def move_check(possible_moves)
    possible_moves.reject do |move|
      @board[move].color == self.color
    end
  end
end
