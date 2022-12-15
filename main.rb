require './game.rb'
require './mode_select.rb'
require './breaker.rb'

game_mode = SelectMode.new()

if game_mode.get_mode == 1
    coder = Coder.new().play
else
    breaker = Breaker.new().play
end