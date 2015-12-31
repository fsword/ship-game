require './team_controller'

class Screen

  attr_accessor :player, :computer

  def initialize player, computer
    self.player = player
    self.computer = computer
  end

  def fire
    repaint
  end

  def repaint
    self.player.repaint
    puts
    self.computer.repaint
  end
end
