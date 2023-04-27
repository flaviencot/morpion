require 'bundler'
Bundler.require

require_relative 'lib/board.rb'
require_relative 'lib/player.rb'
require_relative 'lib/game.rb'
require_relative 'lib/show.rb'

play_again = true

while play_again do
  game = Game.new
  game.turn until game.status != "on going"
  game.game_end

  puts "Do you want to play again? (y/n)"
  play_again = gets.chomp.downcase == 'y'
end

puts "Thanks for playing!"
