require './util'

class Ship

  attr_accessor :size, :cells, :label

  # matrix: [ [ 0,0,1 ], [ 1,0,1 ], [ 0,0,0 ] ]
  def initialize size, label
    self.size  = size
    self.label = label
    self.cells = {}
  end

  def assign matrix
    m = matrix.value
    value = '0' * size
    vertical = true if rand > 0.5
    $logger.info "[ship] vertical: #{vertical}"

    m = Util.reverse m if vertical

    candidates = []
    m.size.times do |row|
      v = m[row].join
      v.length.times do |offset|
        if v[offset..-1].start_with?(value)
          candidate = size.times.map do |i|
            [row, offset + i]
          end
          candidates << candidate
        end
      end
    end

    candidate = candidates[(rand * candidates.size).to_i - 1]
    m = Util.reverse m if vertical

    candidate.each do |(row,col)|
      row, col = col, row if vertical
      m[row][col] = 1
      self.cells.update [row, col] => true
    end
    matrix.update(m)
    $logger.info "[ship]assign m : #{m}"
    $logger.info "[ship]assign matrix: #{cells.keys}"
  end

  def shot_at row, col
    if cells.keys.include? [row,col]
      $logger.info "[ship] #{label} shot at: #{row}, #{col}"
      cells[ [row, col] ] = false
      $logger.info "[ship] #{label}'s status: #{status}"
    end
  end

  def status
    cells.values.reduce(&:|) ? :alive : :sunk
  end
end


