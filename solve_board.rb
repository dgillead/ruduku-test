class SolveBoard
  attr_accessor :original_board
  attr_reader :empty_spots

  def initialize(board_array)
    @original_board = board_array
    @empty_spots = find_empty_spots
  end

  def find_empty_spots
    is_empty = []

    original_board.each_with_index do |element, index|
      if element == "0"
        is_empty.push(index)
      end
    end

    p is_empty
  end

  def row_check(number,index)
    row = index / 9
    original_board[row].include?(number)
  end

  def find_solution
    original_board.each_with_index do |element, index|
      #if col_check && row_check && box_check
        #original_board[element] += 1
      #else
        #original_board[element] -= 1
        #index -= 1
      #end
    end

  end
end
