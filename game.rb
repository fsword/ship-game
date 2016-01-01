require 'logger'
require './screen'
require './model'

$logger = Logger.new 'game.log'

$player = TeamController.new 'player'
$computer = TeamController.new 'computer'

$screen = Screen.new $player, $computer
$player.add_listener $computer
$computer.add_listener $screen

$screen.repaint

Signal.trap("INT") do
  puts "\nstoped."
  exit 0
end

loop do
  $screen.check_result
  print "which cell will you want to shot? "
  if gets =~ /(\d+),(\d+)/
    row = $1.to_i - 1
    col = $2.to_i - 1
    $player.shot_at row, col
  end
end
