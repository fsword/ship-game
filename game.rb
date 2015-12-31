require 'logger'
require './screen'
require './model'

$logger = Logger.new 'game.log'

$player = TeamController.new 'player'
$computer = TeamController.new 'computer'

$screen = Screen.new $player, $computer
$player.add_listener $screen

$screen.repaint


