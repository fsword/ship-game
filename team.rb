require './ship'

class Team
  attr_accessor :ships

  def initialize
    self.ships = []
    self.ships << Ship.new(1, :cruiser)
    self.ships << Ship.new(2, :battle)
    self.ships << Ship.new(3, :destroyer)
  end

  def bind matrix
    self.ships.each{|s| s.assign matrix}
  end

  def shot_at row, col
    self.ships.each{|s| s.shot_at row, col}
  end

  def ships_status
    ships.map do |s|
      [ s.label, s.status.to_s ]
    end
  end
end

