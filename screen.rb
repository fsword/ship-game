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

  def check_result
    if player.win? && computer.win?
      puts 'Player and computer are both winner!'
    elsif player.win?
      puts 'Player is winner!'
    elsif computer.win?
      puts 'Computer is winner!'
    end
    exit 0 if player.win? || computer.win?
  end
end
