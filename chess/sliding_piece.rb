module SlidingPiece
  @@hor_vert_moves = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1]
  ]

  @@diagonal_moves = [
    [1, 1],
    [-1, -1],
    [-1, 1],
    [1, -1]
  ]

  def move_dirs
    if @hor_vert == true && @diagonal == true
      @@hor_vert_moves + @@diagonal_moves
    elsif @hor_vert == true
      @@hor_vert_moves
    else
      @@diagonal_moves
    end
  end

  def moves
    possible_moves = []
    move_dirs.each do |move|
      new_move = @current_pos
      until new_move.any? {|piece_idx| piece_idx > (@board.grid.size - 1) || piece_idx < 0} #add hitting a piece
        # debugger
        temp_move = []
        new_move.each_with_index do |el, idx|
          temp_move[idx] = el + move[idx]
        end
        unless temp_move.any? {|piece_idx| piece_idx > (@board.grid.size - 1) || piece_idx < 0}
          possible_moves << temp_move
          new_move = temp_move
          break unless @board[new_move].class == NullPiece
          # debugger
        else
          break
        end
      end
    end
    move_check(possible_moves)
  end

  def move_check(possible_moves)
    possible_moves.reject do |move|
      @board[move].color == self.color
    end
  end

end
