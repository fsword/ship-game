require 'logger'
require './screen'
require './model'

$logger = Logger.new 'game.log'

$player = TeamController.new 'player'
$computer = TeamController.new 'computer'

$screen = Screen.new $player, $computer
$player.add_listener $screen

$screen.repaint

Signal.trap("INT") do
  puts "\nstoped."
  exit 0
end

loop do
  print "which cell will you want to shot? "
  value = gets
  nums = value.split(/,/)
  row = nums[0].strip.to_i - 1
  col = nums[1].strip.to_i - 1
  $player.shot_at row, col
end
