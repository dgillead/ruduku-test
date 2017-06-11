class Ruduku
  attr_accessor :empty_spots, :string_array ,:original_board, :board_array, :current_line

  def initialize(file_name)
    @string_array = []
    @original_board = []
    @empty_spots = []
    @board_array = []
    read_file(file_name)
  end

  def make_board_array
    original_board.each_slice(9).to_a
  end

  def row_check(number, index)
    row = index / 9
    board_array[row].include?(number)
  end

  def column_check(number,index)
    row = index % 9
    board_array.transpose[row].include?(number)
  end

  def square_check(number,index)
    a_to_c = [board_array[0],board_array[1],board_array[2]].transpose
    d_to_f = [board_array[3],board_array[4],board_array[5]].transpose
    g_to_i = [board_array[6],board_array[7],board_array[8]].transpose
    if index / 9 <= 2
      if index % 9 <= 2
          (a_to_c[0]+a_to_c[1]+a_to_c[2]).include?(number)
        elsif index % 9 >= 3 && index % 9 <= 5
          (a_to_c[3]+a_to_c[4]+a_to_c[5]).include?(number)
        elsif index % 9 >5
          (a_to_c[6]+a_to_c[7]+a_to_c[8]).include?(number)
      end
    elsif index / 9 >= 3 && index / 9 <= 5
      if index % 9 <= 2
          (d_to_f[0]+d_to_f[1]+d_to_f[2]).include?(number)
        elsif index % 9 >= 3 && index % 9 <= 5
          (d_to_f[3]+d_to_f[4]+d_to_f[5]).include?(number)
        elsif index % 9 >5
          (d_to_f[6]+d_to_f[7]+d_to_f[8]).include?(number)
      end
    elsif index / 9 > 5
      if index % 9 <= 2
          (g_to_i[0]+g_to_i[1]+g_to_i[2]).include?(number)
        elsif index % 9 >= 3 && index % 9 <= 5
          (g_to_i[3]+g_to_i[4]+g_to_i[5]).include?(number)
        elsif index % 9 > 5
          (g_to_i[6]+g_to_i[7]+g_to_i[8]).include?(number)
      end
    end
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
  end

  def read_file(file_name)
    File.foreach(file_name).with_index do |line, line_num|
       @string_array = line.chomp("\n")
       @original_board = make_original_board
       @empty_spots = find_empty_spots
       @board_array = make_board_array
       find_solution
    end
  end

  def find_solution
    index = 0
    while index < empty_spots.length
      current_index = empty_spots[index]
      current_number = original_board[current_index]
      current_number += 1
      while current_number <= 9
        if !row_check(current_number, current_index) && !column_check(current_number,current_index) && !square_check(current_number,current_index)
          original_board[current_index] = current_number
          change_board_array(current_number,current_index)
          index += 1
          break
        else
          current_number += 1
        end
      end
      if current_number > 9
        original_board[current_index] = 0
        change_board_array(0,current_index)
        index -= 1
      end
    end
    p '-------------------------'
   p board_array
  end

end
game = Ruduku.new('sample_ruduku_board_inputs.csv')
# game.find_solution
