Rails.application.routes.draw do
  root "sudoku#index"
  post "index", to: "sudoku#index"
  get "generate", to: "sudoku#generate"
  post "generate", to: "sudoku#generate"
  post "solve", to: "sudoku#solve"
  post "check", to: "sudoku#check"
end
