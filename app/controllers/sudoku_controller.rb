class SudokuController < ApplicationController
  before_action :set_board, only: :index

  def index
    @res = params[:res] if params[:res].present?
    @right = params[:right] if params[:right].present?
    render "sudoku/index"
  end

  def generate
    redirect_to action: "index", board: SudokuGenerator.generate
  end

  def solve
    board = []
    (1..9).each do |i|
      row = []
      (1..9).each do |j|
        row << params["#{i}#{j}"].to_i
      end
      board << row
    end
    res = SudokuSolver.solve_sudoku(board)
    redirect_to action: "index", board: board, res: res
  end

  def check
    board = []
    (1..9).each do |i|
      row = []
      (1..9).each do |j|
        row << params["#{i}#{j}"].to_i
      end
      board << row
    end
    right = SudokuSolver.is_right_solution?(board)
    redirect_to action: "index", board: board, right: right
  end

  private
    def set_board
      params[:board].present? ? @board = params[:board] : @board = SudokuGenerator.generate
    end

end