class Show
  def show_board(board)
    puts "     |     |     "
    puts "  #{board.board_cases[1].value}  |  #{board.board_cases[2].value}  |  #{board.board_cases[3].value}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{board.board_cases[4].value}  |  #{board.board_cases[5].value}  |  #{board.board_cases[6].value}  "
    puts "_____|_____|_____"
    puts "     |     |     "
    puts "  #{board.board_cases[7].value}  |  #{board.board_cases[8].value}  |  #{board.board_cases[9].value}  "
    puts "     |     |     "
  end
end






