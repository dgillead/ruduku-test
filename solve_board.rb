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
    p original_board
    original_board.each_with_index do |element, index|
      if !row_check(element, index)
        original_board[element] += 1
      elsif element == 9
        original_board[element] -= 1
        index -= 1
      else
        original_board[element] -= 1
        index -= 1
      end
    end
    p original_board
    # binding.pry
  end
end
