class Pawn < Piece
  @@black_first_directions = [
    [2, 0]
  ]

  @@black_directions = [
    [1, 0]
  ]

  @@white_first_directions = [
    [-2, 0]
  ]

  @@white_directions = [
    [-1, 0]
  ]

  @@black_kill_directions = [
    [1, 1],
    [1, -1]
  ]

  @@white_kill_directions = [
    [-1,-1],
    [-1, 1]
  ]
  def kill_check
    kill_pos_array = []

    if self.color == "black"
      kill_temp = []
      kill_temp << (@current_pos[0] + @@black_kill_directions[0][0])
      kill_temp << (@current_pos[1] + @@black_kill_directions[0][1])
      if @board[kill_temp].color != self.color && @board[kill_temp].class != NullPiece
        kill_pos_array << @@black_kill_directions[0]
      end
      kill_temp = []
      kill_temp << (@current_pos[0] + @@black_kill_directions[1][0])
      kill_temp << (@current_pos[1] + @@black_kill_directions[1][1])
      if @board[kill_temp].color != self.color && @board[kill_temp].class != NullPiece
        kill_pos_array << @@black_kill_directions[1]
      end
    else
      kill_temp = []
      kill_temp << (@current_pos[0] + @@white_kill_directions[0][0])
      kill_temp << (@current_pos[1] + @@white_kill_directions[0][1])
      if @board[kill_temp].color != self.color && @board[kill_temp].class != NullPiece
        kill_pos_array << @@white_kill_directions[0]
      end
      kill_temp = []
      kill_temp << (@current_pos[0] + @@white_kill_directions[1][0])
      kill_temp << (@current_pos[1] + @@white_kill_directions[1][1])
      if @board[kill_temp].color != self.color && @board[kill_temp].class != NullPiece
        kill_pos_array << @@white_kill_directions[1]
      end
    end
    kill_pos_array
  end

  def move_dirs
    # check if pawn is on 1st (idx) row
    # check if pawn is on 6th (idx) row
    # check if there is a piece of different color at kill positions
    # return all possible directions
    # check color of self
    if self.color == "black"
      if @current_pos[0] == 1
        kill_check + @@black_first_directions + @@black_directions
      elsif @current_pos[0] == 7
        []
      else
        kill_check + @@black_first_directions
      end
    else
      if @current_pos[0] == 6
        kill_check + @@white_first_directions + @@white_directions
      elsif @current_pos[0] == 0
        []
      else
        kill_check + @@white_first_directions
      end
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

    new_possible_moves = possible_moves.reject { |move| move.any? {|move_idx| move_idx < 0 || move_idx >= @board.size}}
    move_check(new_possible_moves)
  end

  def move_check(possible_moves)
    possible_moves.reject do |move|
      @board[move].color == self.color
    end
  end
end
