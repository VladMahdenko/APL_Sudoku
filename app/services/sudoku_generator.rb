class SudokuGenerator
  def self.generate
    board = []
    board << [*1..9].shuffle
    board << board[0].rotate(3)
    board << board[0].rotate(6)
    board << board[0].rotate(1)
    board << board[3].rotate(3)
    board << board[3].rotate(6)
    board << board[0].rotate(2)
    board << board[6].rotate(3)
    board << board[6].rotate(6)
    board.each_with_index do |row, i|
      row.each_with_index do |item, j|
        if rand(100) < 66
          board[i][j] = 0
        end
      end
    end
    return board
  end
end


