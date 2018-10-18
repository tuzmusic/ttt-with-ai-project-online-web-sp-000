require "pry"
module Players

  class Computer < Player

    # 0-indexed arrays
    CORNERS = [0,2,6,8]
    MIDDLE = 4

    # helper variables
    attr_reader :board

    #helper methods
    def board(num)
      @board.cells[num]
    end

    def taken?(num)
      @board.taken?(num+1)
    end

    # exec methods
    def move(board) # => 1-indexed board position
      "#{integer_move(board)+1}"
    end # end #move(board)

    def integer_move(board) # => 0-based board index

      @board = board

      if !taken?(MIDDLE) # move in the middle if middle is free
        MIDDLE
      elsif free_corner = CORNERS.find { |corner| !taken?(corner) }
        free_corner
      # elsif target_combo = Game.win_combos.find { |combo| combo.select {|token| token = "O" }.count == 2 }
      #   target_combo.find { |spot|
      #     !(spot+1).taken? }
      else
        # take the first empty spot
        (0..8).find {|i| !taken?(i)}
      end # end if
    end # end #integer_move(board)

  end # end class
end # end module
