class Ruduku
  attr_accessor :empty_spots, :string_array ,:original_board, :board_array
  
  def initialize(string_array)
    @string_array = string_array
    @original_board = make_original_board
    @empty_spots = find_empty_spots
    @board_array = make_board_array
  end
  
  def make_board_array
    original_board.each_slice(9).to_a
  end
  
  def row_check(number, index)
    row = index / 9
    board_array[row].include?(number)
  end
  
  def make_original_board
    int_array = []
    string_array.split('').each_with_index do |element, index|
      int_array[index] = element.to_i
    end
    int_array
  end
  
  def find_empty_spots
    array_with_zero = []
    original_board.each_with_index do |element,index|
      if element == 0
        array_with_zero.push(index)
      end
    end
    return array_with_zero
  end
  
  def change_board_array(number,index)
    row = index / 9
    column = index % 9 
    board_array[row][column] = number
    p string_array
  end
  
  def print_array
    board_array
  end
  
  def find_solution
    empty_spots.each_with_index do |element,index|
      current_number = original_board[element]
      current_number += 1
      while current_number <= 9
        if !row_check(current_number, element)
          original_board[element] = current_number
          change_board_array(current_number,element)
          break
        else
          current_number += 1
        end
      end
      if current_number >= 9
        original_board[element] = 0
        change_board_array(0,element)
        index -= 1
      end
    end
    p board_array
  end


end

p game = Ruduku.new('003020600900305001001806400008102900700000008006708200002609500800203009005010300')
game.find_solution


