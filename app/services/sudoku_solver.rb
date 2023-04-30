class SudokuSolver
  def self.solve_sudoku(board)
    return false if board.nil? || board.empty? || !is_board_valid?(board)
    solve(board)
  end

  def self.solve(board)
    (0...board.length).each do |row|
      (0...board[row].length).each do |col|
        next unless board[row][col] == 0

        (1..9).each do |number|
          next unless is_valid?(board, row, col, number)

          board[row][col] = number

          return true if solve(board)

          board[row][col] = 0
        end

        return false
      end
    end

    return true
  end

  def self.is_valid?(board, row, col, number)
    (0...9).each do |i|
      return false if board[row][i] != 0 && board[row][i] == number # check row
      return false if board[i][col] != 0 && board[i][col] == number # check col
      return false if board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] != 0 && board[3 * (row / 3) + i / 3][3 * (col / 3) + i % 3] == number # check 3 * 3 block
    end
  end

  def self.is_board_valid?(board)
    board.each do |row|
      (1..9).each do |num|
        return false if row.count(num) > 1
      end
    end

    copy = board.transpose
    copy.each do |row|
      (1..9).each do |num|
        return false if row.count(num) > 1
      end
    end

    return true
  end

  def self.contains_zero?(board)
    board.each do |row|
      return true if row.include?(0)
    end
    return false
  end

  def self.is_right_solution?(board)
    return is_board_valid?(board) && !contains_zero?(board)
  end
end