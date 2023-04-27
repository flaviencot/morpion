require 'pry'

class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize
    puts "Welcome to Noughts and Crosses!"

    player1_name = get_player_name("Player 1")
    player1_symbol = get_player_symbol

    player2_name = get_player_name("Player 2")
    player2_symbol = player1_symbol == "X" ? "O" : "X"

    @players = [Player.new(player1_name, player1_symbol), Player.new(player2_name, player2_symbol)]
    @current_player = @players.first
    @board = Board.new
    @status = "on going"
  end
  

  def turn
    Show.new.show_board(@board)
    @board.play_turn(@current_player)

    if @board.victory?
      @status = @current_player
    elsif @board.board_cases.none? { |id, board_case| board_case.value == " " }
      @status = "draw"
    else
      switch_player
    end
  end
  
  def new_round
    @board = Board.new
    @status = "on going"
  end
  
  def game_end
    Show.new.show_board(@board)

    if @status == "draw"
      puts "It's a draw!"
    else
      puts "#{current_player.name} wins!"
    end
  end    

  def get_player_name(player_number)
    puts "#{player_number}, please enter your name:"
    gets.chomp
  end

  def get_player_symbol
    symbol = nil
    until ["X", "O"].include?(symbol)
      puts "Choose your symbol (X or O):"
      symbol = gets.chomp.upcase
      puts "Invalid symbol. Please choose 'X' or 'O'." unless ["X", "O"].include?(symbol)
    end
    symbol
  end

  def switch_player
    @current_player = @current_player == @players.first ? @players.last : @players.first
  end
  
end