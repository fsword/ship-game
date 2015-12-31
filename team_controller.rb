require './matrix'

class TeamController
  attr_accessor :matrix, :team, :label
  def initialize label
    self.label = label

    m = Matrix.new
    self.matrix = MatrixDelegator.new m
    self.team = Team.new
    $logger.info "[team_controller] #{label} bind team"
    self.team.bind m

    @listeners = []
  end

  def shot_at row, col
    self.matrix.shot_at row, col
    self.team.shot_at row, col
    @listeners.each{|l| l.fire}
    nil
  end

  def add_listener listener
    @listeners << listener
  end

  def repaint
    paint_head
    paint_matrix
    paint_result
  end

  def paint_head
    puts "#{label.capitalize}'s Board"
  end

  def paint_matrix
    # title
    print "  ", 5.times.map{|i| " #{i+1} "}.join, "\n"
    # body
    5.times do |i|
      paint_matrix_border
      paint_matrix_line i
    end
    paint_matrix_border
  end

  def paint_matrix_border
    print "  ", (['+']*6).join('---'), "\n"
  end

  def paint_matrix_line row
    print row+1, " |"
    print matrix[row].map{|s| " #{s} "}.join('|')
    print "|\n"
  end

  def paint_result
    result = team.ships_status.map do |label, status|
      "#{label.capitalize}: #{status.capitalize}"
    end.join(", ")
    puts result
  end
end
