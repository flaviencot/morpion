require 'pry'
require_relative 'boardcase'

class Board
  attr_accessor :board_cases

  def initialize
    @board_cases = {}
    (1..9).each { |id| @board_cases[id] = BoardCase.new(id) }
  end

  def play_turn(player)
    puts "It's #{player.name}'s turn. Choose a number between 1 and 9 to place your #{player.symbol}:"
    position = gets.chomp.to_i
    if position < 1 || position > 9
      puts "Invalid position. Please choose a number between 1 and 9."
      play_turn(player)
    elsif @board_cases[position].value != " "
      puts "Position already taken. Please choose a different position."
      play_turn(player)
    else
      @board_cases[position].value = player.symbol
    end
  end

  def victory?
    winning_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
      [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]
    ]

    winning_combinations.each do |combination|
      values = combination.map { |position| @board_cases[position].value }
      if values.all? { |value| value == "X" } || values.all? { |value| value == "O" }
        return true
      end
    end

    false
  end
end