# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = Array.new(9, " ")
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Vertical column
  [1,4,7], # 2nd vertical column
  [2,5,8], # 3rd vertical column
  [0,4,8], # Diagonal
  [2,4,6] # Diagonal
]

#won?
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0])
      return combo
    end
  end
    false
end

#full?
def full?(board)
  board.all?{|p| p != " "}
end

#draw?
def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) && draw?(board) && full?(board)
    return true
  end
end


#winner
def winner(board)
  if !won?(board)
    return board[won?(board)[0]]
  end
end
