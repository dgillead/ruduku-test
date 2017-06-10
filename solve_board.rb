require 'pry'

class SolveBoard
  attr_accessor :original_board, :final_board
  attr_reader :empty_spots

  def initialize(board_array)
    @original_board = board_array
    @final_board = split_board
    @empty_spots = find_empty_spots
    @possible_solution = find_solution
    # binding.pry

  end

  def split_board
    original_board.each_slice(9).to_a
  end

  def find_empty_spots
    is_empty = []

    original_board.each_with_index do |element, index|
      if element == 0
        is_empty.push(index)
      end
    end

    is_empty
    # binding.pry
  end

  def row_check(number, index)
    row = index / 9
    final_board[row].include?(number)
    # binding.pry
  end

  def find_solution
binding.pry
    empty_spots.each_with_index do |element,index|
# binding.pry
      current_number = original_board[element]
      current_number += 1
      while current_number <= 9
# binding.pry
        if !row_check(current_number, element)
          original_board[element] = current_number
          break
# binding.pry
        else
          current_number += 1
# binding.pry
        end
      end
# binding.pry
      if current_number >= 9
        original_board[element] = 0
        index -= 1
binding.pry
      end
    end
  end

end
