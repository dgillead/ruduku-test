require_relative 'solve_board'

class Rudoku
  def initialize(board_string)
    @board = board_string.split('').each_slice(9).to_a
    @board.each_with_index do |element, index|
      @board[index] = element.to_i
    end
    @solution = SolveBoard.new(@board)
  end

  # def board
  #   @.each_slice(9).to_a
  # end
end

game = Rudoku.new('003020600900305001001806400008102900700000008006708200002609500800203009005010300')
game.original_board
